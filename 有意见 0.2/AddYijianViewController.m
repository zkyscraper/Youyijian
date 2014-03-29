//
//  AddYijianViewController.m
//  有意见 0.2
//
//  Created by Demo Monkeys on 14-3-29.
//  Copyright (c) 2014年 DM. All rights reserved.
//

#import "AddYijianViewController.h"

@interface AddYijianViewController ()

@end

@implementation AddYijianViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * it = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(myReturned:)];
    [self.navigationItem setLeftBarButtonItem:it];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)myReturned:(UIStoryboardSegue *)segue {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)submit:(id)sender
{
    if(YES){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

- (IBAction)TextField_DidEndOnExit:(id)sender {
    // 隐藏键盘.
    [sender resignFirstResponder];
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

@end
