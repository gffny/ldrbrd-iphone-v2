//
//  LBSignScorecardVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 10/13/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBSignScorecardVC.h"
#import "LBRestFacade.h"

@interface LBSignScorecardVC ()

@property (strong, nonatomic) IBOutlet UIButton *sgnScrcrdBtn;
@end

@implementation LBSignScorecardVC

LBRestFacade *restFacade;


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

    [self.sgnScrcrdBtn addTarget:self action:@selector(sgnScrcrdBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
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
 scorecardId
}
*/
- (void)sgnScrcrdBtnClckd:(UIButton *)sender {
    
    NSLog(@"submit scorecard button clicked");
    [restFacade asynchSgnScorecard:[[LBDataManager sharedInstance] getScorecardId] withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Scorecard Sign Success");
        // move to new screen
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Scorecard Sign Failure");
        
    }];
    
}
@end
