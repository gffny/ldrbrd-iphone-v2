//
//  lbMainVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 3/30/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbMainVC.h"
#import "LBUpcomingRoundsTableVC.h"
#import "LBJsonData.h"

@interface lbMainVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

@property (strong, nonatomic) IBOutlet UIButton *playNowBtn;

@property (strong, nonatomic) IBOutlet UIButton *scheduleRoundBtn;

@end

@implementation lbMainVC

- (void)playUpcomingRoundWithId:(NSString *)roundId
{
    //TODO get course, and competition data using the roundId
    [self performSegueWithIdentifier:@"seg_plyrnd" sender:self];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.revealButtonItem setTarget: self.revealViewController];
    [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    
    [self.playNowBtn addTarget:self action:@selector(playNowBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
    [self.scheduleRoundBtn addTarget:self action:@selector(scheduleRoundBtnClckd:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)playNowBtnClckd:(UIButton *)sender
{
    NSLog(@"play now button clicked");
    [self performSegueWithIdentifier:@"seg_plynw" sender:self];
}

- (void)scheduleRoundBtnClckd:(UIButton *)sender
{
    NSLog(@"schedule round button clicked");
    [self performSegueWithIdentifier:@"seg_schdlrnd" sender:self];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        // Custom initialization
        NSLog(@"blah");
    }
    return self;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"seg_embdUpcmngRnds"])
    {
        LBUpcomingRoundsTableVC *urtvc = (LBUpcomingRoundsTableVC *)segue.destinationViewController;
        urtvc.parentVC = self;
    }
    if ([segue.identifier isEqualToString:@"seg_plyrnd"]) {
        NSDictionary *course = [LBJsonData courseJson];

        UIViewController *destViewController = segue.destinationViewController;
        //destViewController.course = course;
    }
}

@end
