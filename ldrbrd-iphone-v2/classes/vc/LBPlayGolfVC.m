//
//  LBPlayGolfVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/25/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBPlayGolfVC.h"
#import "LBGolfShotProfiler.h"

@interface LBPlayGolfVC ()

@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeRight;
@property (nonatomic, strong) IBOutlet UIGestureRecognizer *touchBeganRecogniser;
@property (nonatomic, strong) IBOutlet UILongPressGestureRecognizer *lpGesture;
@property (nonatomic, strong) NSMutableArray *flightPathArray;
@property int counter;


@end

@implementation LBPlayGolfVC

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
    
    // Create and initialize a tap gesture
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showGestureForTapRecognizer:)];
    self.tapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:self.tapRecognizer];
    
    // Create and initialize swipe left gesture
    self.oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeLeft:)];
    [self.oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.oneFingerSwipeLeft];
    
    // Create and initialize swipe right gesture
    self.oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)];
    [self.oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.oneFingerSwipeRight];

    // Create and initialise the long press gesture 
    self.lpGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer: self.lpGesture];

    self.flightPathArray = [[NSMutableArray alloc] init];
    self.counter = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer {
    
    // Insert your own code to handle swipe right
    NSLog(@"right");
    
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left

    NSLog(@"left");
}

- (IBAction)showGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer {
    
    // Get the location of the gesture
    CGPoint location = [recognizer locationInView:self.view];
    NSLog([NSString stringWithFormat: @"fcuk: %f", location.x]);
}

- (void)handleGesture:(UILongPressGestureRecognizer *)gesture {
    
    if([gesture state] == UIGestureRecognizerStateBegan) {
        // clear flightPath array
        [self.flightPathArray removeAllObjects];
        NSLog(@"i   X           Y");
        self.counter = 0;


    }
    CGPoint location = [gesture locationInView:gesture.view];
    [self.flightPathArray addObject:[NSValue valueWithCGPoint:location]];
    NSLog([NSString stringWithFormat: @"%i %f %f", self.counter++, location.x, location.y]);
    if([gesture state] == UIGestureRecognizerStateEnded || [gesture state] == UIGestureRecognizerStateFailed) {
        LBGolfShotProfile *shotProfile = [LBGolfShotProfiler profileShotWithPoints: self.flightPathArray];
        
    }
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
