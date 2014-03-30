//
//  YijianAppDelegate.h
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-28.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface YijianAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) UIWindow *window;

@end
