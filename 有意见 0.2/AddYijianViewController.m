//
//  AddYijianViewController.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "AddYijianViewController.h"

#import "XDRequestManager.h"

@interface AddYijianViewController ()<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@end

@implementation AddYijianViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _location = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * it = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(myReturned:)];
    [self.navigationItem setLeftBarButtonItem:it];
    
    self.locationLabel.text = @"正在定位...";
    if([CLLocationManager locationServicesEnabled])
    {
        [self.locationManager startUpdatingLocation];
    }
    else{
        self.locationLabel.text = @"无法定位";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

#pragma mark - getter

- (CLLocationManager *)locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1000.0f;
//        _locationManager.purpose = @"To provide functionality based on user's current location.";

    }
    
    return _locationManager;
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.location = newLocation;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation: newLocation completionHandler:^(NSArray *array, NSError *error) {
        if (array.count > 0) {
            CLPlacemark *placemark = [array objectAtIndex:0];
            self.locationLabel.text = placemark.name;
        }
    }];
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    self.locationLabel.text = @"定位失败";
}

#pragma mark - action

-(IBAction)myReturned:(UIStoryboardSegue *)segue {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)submit:(id)sender
{
    if (self.location == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"获取不到位置信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
        return;
    }
    
    NSDictionary *parameter = @{@"objectName":self.objectTextField.text, @"contentString":self.contentTextField.text, @"latitude":[NSString stringWithFormat:@"%lf", self.location.coordinate.latitude], @"longitude":[NSString stringWithFormat:@"%lf", self.location.coordinate.longitude]};
    [[XDRequestManager defaultManager] postPath:@"insert.php" parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
    }];
}

- (IBAction)TextField_DidEndOnExit:(id)sender {
    // 隐藏键盘.
    [sender resignFirstResponder];
}

@end
