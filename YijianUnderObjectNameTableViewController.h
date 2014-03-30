//
//  YijianUnderObjectNameTableViewController.h
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YijianUnderObjectNameTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *nameNavigationBar;
@property (nonatomic,weak) NSString *name;
@property (nonatomic) NSArray *contents;

@end
