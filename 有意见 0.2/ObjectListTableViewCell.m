//
//  ObjectListTableViewCell.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "ObjectListTableViewCell.h"

@implementation ObjectListTableViewCell

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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
