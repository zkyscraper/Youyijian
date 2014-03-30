//
//  YijianTableViewController.h
//  有意见 0.1
//
//  Created by shao on 14-3-25.
//  Copyright (c) 2014年 shao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface YijianTableViewController : UITableViewController


@property (nonatomic, strong) NSArray *objectTitles;
@property (nonatomic, strong) NSArray *yijianContents;
@property (nonatomic, strong) NSArray *similarYijians;
@property (nonatomic) int currentId;
@end
