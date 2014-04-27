//
//  BNRMapPoint.h
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject<MKAnnotation>

{
    
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *) t subtitle:(NSString *)s;

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,readonly) UIImage *image;

@end
