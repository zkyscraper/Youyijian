//
//  MapViewController.m
//  有意见 0.2
//
//  Created by shao on 14-3-30.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "MapViewController.h"
#import "BNRMapPoint.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        locationManager = [[CLLocationManager alloc]init];
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_worldView setDelegate:self];
    [_worldView setShowsUserLocation:YES];
    
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(39.9815615,116.30738);
//    BNRMapPoint *mp = [[BNRMapPoint alloc]initWithCoordinate:coord title:@"300"];
//    
//    [_worldView addAnnotation:mp];
    _mps = @[[[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9815615,116.30738) title:@"领导" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9813868,116.3073586) title:@"小豆面馆：这家东西真难吃。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9807785,116.3075946) title:@"本月工资12000，我是Band7，你呢？" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.979912,116.3070302) title:@"新辣道：上菜速度非常慢，服务员态度很差！" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9782028,116.306895) title:@"我的老板是250，今天又有了脑残突发奇想" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9791894,116.3088445) title:@"物业总是不来清扫我们的楼道。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9793093,116.3054498) title:@"小米手机：发热实在是太厉害了，烫死我了。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0515757,116.2965695) title:@"联想电脑：用3个月面板就脱开了。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0492597,116.2976424) title:@"又在这儿被贴条了，你们要小心！" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0516085,116.3009255) title:@"我实在是憋不住了，这家公司太奇葩了！！！" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0480114,116.2962048) title:@"园区里的树都枯死了，环卫干啥去了？" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0513754,116.2999277) title:@"中国国航：服务态度实在不怎么样哦。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0508662,116.2996595) title:@"这个路口经常有车闯红灯，交警也不管管。" subTitle:@"领导真不靠谱"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0561132,116.2997948) title:@"你们这些车非得在天天强行并线吗，下回我宁撞不让。" subTitle:@"领导真不靠谱"]
             ];
    
    
    [_worldView addAnnotations:_mps];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    [_worldView setDelegate:nil];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region =MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [_worldView setRegion:region animated:YES];
}


@end
