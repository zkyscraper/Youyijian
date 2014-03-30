//
//  ObjectListTableViewCell.h
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *objectNumberRect;
@property (weak, nonatomic) IBOutlet UILabel *objectNuberLongRect;

@property (weak, nonatomic) IBOutlet UILabel *objectTilteName;

//{
//    UIView *_backgroudView;
//}

@property (nonatomic) CGFloat drawWidth;


@end
