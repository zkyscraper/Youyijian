//
//  YijianTableViewCell.m
//  有意见 0.1
//
//  Created by shao on 14-3-25.
//  Copyright (c) 2014年 shao. All rights reserved.
//

#import "YijianTableViewCell.h"

@implementation YijianTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
          [self.contentLabel setFont:[UIFont fontWithName:@"方正清刻本悦宋简体" size:17.0]];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
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

-(IBAction)selectObject:(id)sender
{
    if(!self.selected){
        [self setSelected:YES];
    }
}

@end
