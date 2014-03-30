//
//  BNRMapPoint.m
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "BNRMapPoint.h"



@implementation BNRMapPoint
@synthesize coordinate,title,image,subTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subTitle:(NSString *)s
{
    self =[super init];
    if (self) {
        coordinate =c;
        title =t;
        subTitle =s;
        image = [UIImage imageNamed:@"bubble.png"];
        
//        [self setTitle:t];
    }
    
    return self;
}

@end
