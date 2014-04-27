//
//  YijianUnderObjectTableViewCell.m
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "YijianUnderObjectTableViewCell.h"

@implementation YijianUnderObjectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [self.YijianContent setFont:[UIFont fontWithName:@"FZQKBYSJW--GB1-0" size:17.0]];
    
    [self.tongganButton setImage:[UIImage imageNamed:@"heart_empty.png"] forState:UIControlStateSelected];
    
    [self.tongganButton setImage:[UIImage imageNamed:@"heart_full.png"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)liked:(id)sender
{
    if(!self.tongganButton.selected){
        [self.tongganButton setSelected:YES];
    }
}

@end
