//
//  LBLoginVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/9/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBLoginVC.h"
#import "LBRestFacade.h"

@interface LBLoginVC ()

@end

@implementation LBLoginVC

@synthesize warningLabel;
@synthesize loginButton;

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
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"seg_auth" sender:self];
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    LBRestFacade *restFacade = [[LBRestFacade alloc] init];
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
