//
//  LBSelectGolfersVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBSelectGolfersVC.h"

@interface LBSelectGolfersVC ()

@property LBDataManager *dataManager;

@end

@implementation LBSelectGolfersVC

@synthesize schdlRndBtn;
@synthesize slctGlfClbsBtn;

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.slctGlfClbsBtn addTarget:self action:@selector(slctGlfClbsBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
    [self.schdlRndBtn addTarget:self action:@selector(schdlRndBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
    [[LBDataManager sharedInstance] resetGolferScoreArray];
}

- (void)slctGlfClbsBtnClckd:(UIButton *)sender {

    NSLog(@"select golf clubs button clicked");
    [self performSegueWithIdentifier:@"seg_plyglf" sender:self];
}

- (void)schdlRndBtnClckd:(UIButton *)sender {

    NSLog(@"schedule round button clicked");
    [self performSegueWithIdentifier:@"seg_schdlrnd" sender:self];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
