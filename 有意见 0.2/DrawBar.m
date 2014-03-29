//
//  DrawBar.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "DrawBar.h"

@implementation DrawBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    
    CGContextFillRect(ctx, rect);
//    CGContextStrokePath(ctx);

    
}

@end
