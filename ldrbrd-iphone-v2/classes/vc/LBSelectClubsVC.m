//
//  LBSelectClubsVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBSelectClubsVC.h"

@interface LBSelectClubsVC ()

@end

@implementation LBSelectClubsVC

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
    [self.plyGlfBtn addTarget:self action:@selector(plyGlfBtnClckd:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)plyGlfBtnClckd:(UIButton *)sender
{
    NSLog(@"play glf button clicked");
    self.navigationController.navigationBar.hidden = YES;
    [self performSegueWithIdentifier:@"seg_plyglf" sender:self];
}

@end
