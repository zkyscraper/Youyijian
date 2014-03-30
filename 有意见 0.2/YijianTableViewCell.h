//
//  YijianTableViewCell.h
//  有意见 0.1
//
//  Created by shao on 14-3-25.
//  Copyright (c) 2014年 shao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YijianTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *tongganButton;
@property (nonatomic) int myId;



@end
