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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//
//    CGContextSetRGBFillColor(context, 0.6, 0.6, 0.6, 1);
//    CGContextFillRect(context, CGRectMake(20, 20, _drawWidth, 27));
//    CGContextStrokePath(context);
//}

- (void)setDrawWidth:(CGFloat)drawWidth
{
//    self.backgroundColor = [UIColor redColor];
    
    
    _drawWidth = drawWidth;
    _objectNumberRect.frame = CGRectMake(12, 16, drawWidth, 27);
    _objectNumberRect.backgroundColor =[UIColor darkGrayColor];
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1);
//    CGContextFillRect(ctx, CGRectMake(20, 20, drawWidth, 27));
//    CGContextStrokePath(ctx);
}

@end
