//
//  LBSelectGolfersVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBSelectGolfersVC.h"

@interface LBSelectGolfersVC ()

@end

@implementation LBSelectGolfersVC

@synthesize schdlRndBtn;
@synthesize slctGlfClbsBtn;

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
    [self.slctGlfClbsBtn addTarget:self action:@selector(slctGlfClbsBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
    [self.schdlRndBtn addTarget:self action:@selector(schdlRndBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)slctGlfClbsBtnClckd:(UIButton *)sender
{
    NSLog(@"select golf clubs button clicked");
    [self performSegueWithIdentifier:@"seg_slctglfclbs" sender:self];
}

- (void)schdlRndBtnClckd:(UIButton *)sender
{
    NSLog(@"schedule round button clicked");
    [self performSegueWithIdentifier:@"seg_schdlrnd" sender:self];
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

@end
