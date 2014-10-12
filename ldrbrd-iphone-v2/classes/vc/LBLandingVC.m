//
//  LBLandingVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 10/9/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBLandingVC.h"
#import "LBRestFacade.h"

@interface LBLandingVC ()

@end

@implementation LBLandingVC

@synthesize username;
@synthesize password;
@synthesize warningLabel;
@synthesize loginButton;

LBRestFacade *restFacade;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loginAction:(UIButton *)sender
{
    NSLog(@"login action: really should check credentials");
    NSLog(username.text);
    [restFacade asynchAuthenticateWithUsername:username.text andPassword:password.text withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Auth Success");
        // move to new screen
        [self dismissViewControllerAnimated:YES completion:nil];
        [self performSegueWithIdentifier:@"seg_auth" sender:self];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Auth Failure");
        [warningLabel setText: @"authentication failed"];
        
    }];
}

- (void)viewDidLoad
{
    restFacade = [[LBRestFacade alloc] init];
    // Do any additional setup after loading the view.
    [restFacade asynchBackendOnlineCheckWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [warningLabel setText: @"Backend Online"];
        [super viewDidLoad];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Backend Offline");
        //SOMEHOW SHOW THE BACKEND IS OFFLINE
        [warningLabel setText: @"Backend Offline"];
        //Maybe have an offline mode?!
        //[loginButton setEnabled:NO];
        [super viewDidLoad];
        
    }];
    [self.loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

