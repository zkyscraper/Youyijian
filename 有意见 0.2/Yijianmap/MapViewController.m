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

//设置地图上的字体？？？
//    [_worldView setFont:[UIFont fontWithName:@"FZQKBYSJW--GB1-0" size:17.0]];
    
    [_worldView setDelegate:self];
    [_worldView setShowsUserLocation:YES];
    
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(39.9815615,116.30738);
//    BNRMapPoint *mp = [[BNRMapPoint alloc]initWithCoordinate:coord title:@"300"];
//    
//    [_worldView addAnnotation:mp];
    _mps = @[[[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9815615,116.30738) title:@"领导" subtitle:@"领导真不靠谱,用微信大半夜还要安排工作，把他屏蔽了又跑来问怎么看不到你的朋友圈了，我是工作又不是卖身。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9813868,116.3073586) title:@"小豆面馆" subtitle:@"这家东西真难吃，地段好所以那么贵吗？"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9807785,116.3075946) title:@"收入" subtitle:@"本月工资12000，我是Band7，你呢？"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.979912,116.3070302) title:@"新辣道" subtitle:@"上菜速度非常慢，服务员态度很差！"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9782028,116.306895) title:@"领导" subtitle:@"我的老板是250，今天又有了脑残突发奇想"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9791894,116.3088445) title:@"物业" subtitle:@"物业总是不来清扫我们的楼道。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(39.9793093,116.3054498) title:@"小米手机" subtitle:@"小米牌的暖手宝还可以打电话听音乐，我和小伙伴们都惊呆了。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0515757,116.2965695) title:@"联想电脑" subtitle:@"用3个月面板就脱开了，打电话给客服也找不到。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0492597,116.2976424) title:@"有意见" subtitle:@"又在这儿被贴条了，你们要小心！"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0516085,116.3009255) title:@"公司" subtitle:@"我实在是憋不住了，这家公司太奇葩了！！！"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0480114,116.2962048) title:@"软件园" subtitle:@"园区里的树都枯死了，环卫干啥去了？"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0513754,116.2999277) title:@"中国国航" subtitle:@"服务态度实在不怎么样哦。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0508662,116.2996595) title:@"有意见" subtitle:@"这个路口经常有车闯红灯，交警也不管管。"],
             [[BNRMapPoint alloc]initWithCoordinate:CLLocationCoordinate2DMake(40.0561132,116.2997948) title:@"有意见" subtitle:@"你们这些车非得在天天强行并线吗，下回我宁撞不让。"]
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
