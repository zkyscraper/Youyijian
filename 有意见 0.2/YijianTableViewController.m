//
//  YijianTableViewController.m
//  有意见 0.1
//
//  Created by shao on 14-3-25.
//  Copyright (c) 2014年 shao. All rights reserved.
//

#import "YijianTableViewController.h"
#import "YijianTableViewCell.h"
#import "YijianUnderObjectNameTableViewController.h"

#import "XDRequestManager.h"
#import "SVPullToRefresh.h"

@interface YijianTableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation YijianTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    __weak YijianTableViewController *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf tableViewDidTriggerHeaderRefresh];
    }];
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf tableViewDidTriggerFooterRefresh];
    }];
    
    self.tableView.showsPullToRefresh = YES;
    self.tableView.showsInfiniteScrolling = NO;
    
    [self.tableView triggerPullToRefresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"YijianTableCell";
    YijianTableViewCell *cell = (YijianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[YijianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row < [self.dataArray count]) {
        NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
        cell.indexPath = indexPath;
        NSString *title = [dic objectForKey:@"objectName"];
        if (!title || [title isKindOfClass:[NSNull class]]) {
            title = @"";
        }
        [cell.titleButton setTitle:title forState:UIControlStateNormal];
        
        NSString *content = [dic objectForKey:@"contentString"];
        if (!content || [content isKindOfClass:[NSNull class]]) {
            content = @"";
        }
        cell.contentLabel.text = content;
        
//        NSString *tmpStr = [NSString stringWithFormat:@"有%@条同感意见", [dic objectForKey:@""]];
        
    }
    
    return cell;
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"ShowObjectYijianFromFirst"]) {
        YijianUnderObjectNameTableViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        NSString *title = [[self.dataArray objectAtIndex:index.row] objectForKey:@"objectName"];
        if (!title || [title isKindOfClass:[NSNull class]]) {
            title = @"";
        }
        
        detailViewController.title = title;
    }
}

#pragma mark - date

///下拉刷新回调
- (void)tableViewDidFinishHeaderRefreshReload:(BOOL)reload
{
    __weak YijianTableViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload) {
            [weakSelf.tableView reloadData];
        }
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    });
}

///上拉刷新回调
- (void)tableViewDidFinishFooterRefreshReload:(BOOL)reload
{
    __weak YijianTableViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload) {
            [weakSelf.tableView reloadData];
        }
        
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    });
}

- (void)tableViewDidTriggerHeaderRefresh
{
    [self.dataArray removeAllObjects];
    __block __weak YijianTableViewController *weakSelf = self;
    [[XDRequestManager defaultManager] getPath:@"getJSON.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject && [responseObject count] > 0) {
            [weakSelf.dataArray addObjectsFromArray:responseObject];
        }
        
        [weakSelf tableViewDidFinishHeaderRefreshReload:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}

- (void)tableViewDidTriggerFooterRefresh
{
    
}

@end
