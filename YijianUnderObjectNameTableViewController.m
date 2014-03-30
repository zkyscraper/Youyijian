//
//  YijianUnderObjectNameTableViewController.m
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "YijianUnderObjectNameTableViewController.h"
#import "YijianUnderObjectTableViewCell.h"

@interface YijianUnderObjectNameTableViewController ()

@end

@implementation YijianUnderObjectNameTableViewController

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
    
    _contents = @[@"我搜索的是中国人寿的报案电话，你非要给我一个中国平安的！！！我是要报案啊！！！",
                        @"公司架构又调整了，我们这些底层员工以后看来是越来越没上升空间了。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                        @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。",
                  @"饥饿营销做得太过分了，手机质量问题明明挺严重，却硬要造全国疯抢的局面。"];
    
    
    _nameNavigationBar.title = _name;
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
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YijianUnderObjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YijianUnderObjectTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.YijianContent.text =_contents[indexPath.row];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
