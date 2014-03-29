//
//  AddYijianViewController.h
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddYijianViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UITextField *objectTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@end
