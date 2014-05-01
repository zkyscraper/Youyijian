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

@interface YijianTableViewController ()

@end

@implementation YijianTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    
    _objectTitles = @[@"百度搜索",
                      @"中关村软件园",
                      @"小米手机",
                      @"百度搜索",
                      @"百度搜索"];
    
    _yijianContents = @[@"我搜索的是中国人寿的报案电话，你非要给我一个中国平安的！！！我是要报案啊！！！",
                        @"公司架构又调整了，我们这些底层员工以后看来是越来越没上升空间了。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。"];
    
    _similarYijians =@[@"2000",
                       @"1000",
                       @"1000",
                       @"1000",
                       @"1000"];
    
/*
    //    遍历所有字体。这是已经把新字体添加进去了
    NSArray *fontFamilies = [UIFont familyNames];
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
 */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return _yijianContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"YijianTableCell";
    YijianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    int row =[indexPath row];
    cell.myId =row;
//  cell.titleButton.currentTitle = _ObjectTitles[row];
//    cell.similarButton.text = [_SimilarYijian[row];
    
    [cell.titleButton setTitle:_objectTitles[row] forState:UIControlStateNormal];
    cell.contentLabel.text = _yijianContents[row];

    
    NSString *newButtonText = @"有1000条同感意见";
//    [newButtonText stringByAppendingString:_similarYijians[row]];
[newButtonText stringByAppendingString:@"1000"];
    [newButtonText stringByAppendingString:@"条同感意见"];
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
//-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    
//    if (self) {
//        locationManager = [[CLLocationManager alloc]init];
//        [locationManager setDelegate:self];
//        
//        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//        [locationManager startUpdatingLocation];
//    }
//    return self;
//}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"ShowObjectYijianFromFirst"]) {
        YijianUnderObjectNameTableViewController *detailViewController = [segue destinationViewController];
        
//        UITouch *touch = [[UITouch alloc]init];
//        NSIndexPath *myIndexPath = [self.tableView indexPathForRowAtPoint:[touch locationInView:self.view]];
//        YijianUnderObjectTableViewCell *cell = (YijianUnderObjectTableViewCell *) [[[titleButton superview]superview] superview];
        
//怎么才能知道当前的按钮在哪个Cell里头啊？？？
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = [myIndexPath row];
//        int row = _currentId;
        detailViewController.name = _objectTitles[row];
    }
}


@end
