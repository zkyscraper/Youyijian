//
//  YijianAppDelegate.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-28.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "YijianAppDelegate.h"

@implementation YijianAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    [self setupAppearance];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - private

- (void)setupAppearance
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version >= 5.0)
    {
        //导航栏
        //        NSString *imageName = @"";
        //        UIImage *tempImage = [[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        //        [[UINavigationBar appearance] setBackgroundImage:tempImage forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
        [attributesDictionary setValue:[UIFont fontWithName:@"FZQKBYSJW--GB1-0" size:18.0] forKey:NSFontAttributeName];
        [attributesDictionary setValue:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
        [[UINavigationBar appearance] setTitleTextAttributes:attributesDictionary];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@",newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",locations);
}

-(void) locationManager:(CLLocationManager *) manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location %@",error);
}
-(void)dealloc
{
    [locationManager setDelegate:nil];
}

@end
