//
//  ObjectListTableViewController.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "ObjectListTableViewController.h"
#import "ObjectListTableViewCell.h"
#import "YijianUnderObjectNameTableViewController.h"

@interface ObjectListTableViewController ()

@end

@implementation ObjectListTableViewController

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
    
    _objectNames =@[@"百度搜索",
                    @"小米手机",
                    @"中国国航",
                    @"上岛咖啡",
                    @"QQ",
                    @"ThinkPad",
                    @"去哪儿",
                    @"联想笔记本",
                    @"大众高尔夫",
                    @"青岛啤酒"
                    ];
    _objectNumbers =@[@"1000",
                      @"900",
                      @"800",
                      @"700",
                      @"600",
                      @"500",
                      @"400",
                      @"300",
                      @"200",
                      @"100"
                      ];

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
    return _objectNames.count;
}


- (ObjectListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ObjectList" forIndexPath:indexPath];
    static NSString *CellIdentifier = @"ObjectListTableViewCell";
    ObjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ObjectListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
//    cell.textLabel.frame = CGRectMake(40, 30, 150, 20);
//    cell.textLabel.textAlignment =NSTextAlignmentLeft;

    cell.objectTilteName.text = [_objectNames objectAtIndex:indexPath.row];
    cell.objectTilteName.text = [cell.objectTilteName.text stringByAppendingString:@"    有 "];
     cell.objectTilteName.text = [cell.objectTilteName.text stringByAppendingString:[_objectNumbers objectAtIndex:indexPath.row]];
    cell.objectTilteName.text = [cell.objectTilteName.text stringByAppendingString:@" 条意见"];
//    cell.textLabel.textColor = [UIColor lightGrayColor];
//    cell.textLabel.font = [UIFont fontWithName:@"黑体" size:15];
    
//    CGFloat length = [[_objectNumbers objectAtIndex:indexPath.row] floatValue] / 3;
//    [cell setDrawWidth:length];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowObjectYijian"]) {
        YijianUnderObjectNameTableViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = [myIndexPath row];
        detailViewController.name = _objectNames[row];
    }
    
}


@end
