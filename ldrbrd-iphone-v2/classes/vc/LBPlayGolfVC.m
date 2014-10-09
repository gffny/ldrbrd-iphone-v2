//
//  LBPlayGolfVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/25/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBDataManager.h"
#import "LBRestManager.h"
#import "LBPlayGolfVC.h"
#import "LBGolfShotProfiler.h"
#import "LBCourseDto.h"
#import "LBDummyData.h"
#import "LBLocationManager.h"

@interface LBPlayGolfVC ()

// UI Gestures
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeRight;
@property (nonatomic, strong) IBOutlet UIGestureRecognizer *touchBeganRecogniser;
@property (nonatomic, strong) IBOutlet UILongPressGestureRecognizer *lpGesture;

// HANDY
@property (nonatomic, strong) LBLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *flightPathArray;
@property (nonatomic, strong) LBCourseDto *course;
@property (nonatomic) int holeScore;
@property (nonatomic) int holePointer;

@property (nonatomic) NSMutableArray *holeScoreArray;

// UI LABELS
@property (strong, nonatomic) IBOutlet UILabel *parLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *indexLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *holeScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *holeNumberLabel;

@end

@implementation LBPlayGolfVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Initialise Gestures
    [self addGestureRecognisers];

    [self setLocationManager: [LBLocationManager sharedInstance]];
    [[LBDataManager sharedInstance] initialiseCourse: self.course];
    NSLog(@"Playing scorecardId %@", [[LBDataManager sharedInstance] scorecardId]);

    // Initialise Storage
    [self setFlightPathArray: [[NSMutableArray alloc] init]];
    if(self.course == NULL)
    {
        [self setCourse: [LBDummyData dummyCourse]];
    }
    
    for(int i=0; i<self.course.courseHoleMap.count; i++)
    {
        [[LBDataManager sharedInstance] setScore: [NSNumber numberWithInt:0] forHole: [NSNumber numberWithInt:i]];
    }
    self.holeScore = 0;
    self.holePointer = 0;
    self.holeScoreArray = [[NSMutableArray alloc] initWithCapacity: self.course.courseHoleMap.count];

    [self loadHoleIntoView: [self.course courseHoleWithNumber: self.holePointer]];
}

- (void) loadCourseInView: (LBCourseDto *) courseToLoad
{
    [self setCourse: courseToLoad];
}

- (void) loadHoleIntoView: (LBCourseHoleDto *) courseHole
{

    [self.holeNumberLabel setText: [NSString stringWithFormat:@"Hole Number: %li", courseHole.holeNumber]];
    [self.parLabel setText: [NSString stringWithFormat: @"%li", courseHole.par]];
    [self.distanceLabel setText: [NSString stringWithFormat: @" %li", courseHole.distance]];
    [self.indexLabel setText: [NSString stringWithFormat: @"%li", courseHole.index]];
    [self.descriptionLabel setText: courseHole.description];
    [self.holeScoreLabel setText: [NSString stringWithFormat: @"%i", self.holeScore]];
}

- (void) handleGesture:(UILongPressGestureRecognizer *)gesture
{
    
    if([gesture state] == UIGestureRecognizerStateBegan)
    {
        // clear flightPath array
        [self.flightPathArray removeAllObjects];
    }
    [[LBLocationManager sharedInstance] currentLocation];
    CGPoint location = [gesture locationInView:gesture.view];
    [self.flightPathArray addObject:[NSValue valueWithCGPoint:location]];
    if([gesture state] == UIGestureRecognizerStateEnded || [gesture state] == UIGestureRecognizerStateFailed)
    {
        self.holeScore++;
        [self.holeScoreLabel setText: [NSString stringWithFormat: @"%i", self.holeScore]];
        //LBGolfShotProfile *shotProfile = [LBGolfShotProfiler profileShotWithPoints: self.flightPathArray];
    }
    // add score to hole @ gps location
}


- (IBAction) showGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer
{
    
    self.holeScore++;
    [self.holeScoreLabel setText: [NSString stringWithFormat: @"%i", self.holeScore]];
    
    // add score to hole @ gps location
}


- (void) oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer
{
    // go forward hole
    if(self.holePointer < self.course.courseHoleMap.count)
    {
        NSLog(@"storing the score %i for hole %i", self.holeScore, [self actualHoleNumber]);
        [[LBDataManager sharedInstance] setScore: [NSNumber numberWithInt:self.holeScore] forHole: [NSNumber numberWithInt: self.holePointer]];
        [LBRestManager recordHole: [self actualHoleNumber] withScore: self.holeScore];
        if(self.holePointer < self.course.courseHoleMap.count-1)
        {
            self.holePointer++;
            NSLog(@"going to hole %i", [self actualHoleNumber]);
            if([[LBDataManager sharedInstance] getScoreForHole: [NSNumber numberWithInt: self.holePointer]])
            {
                [self setHoleScore: [[NSNumber numberWithInteger:[[LBDataManager sharedInstance] getScoreForHole: [NSNumber numberWithInt: self.holePointer]]] intValue]];
            }
            else
            {
                self.holeScore = 0;
            }
            [self loadHoleIntoView: [self.course courseHoleWithNumber:self.holePointer]];
        }
        else
        {
            // segue to review
            [self performSegueWithIdentifier:@"seg_shwsmmry" sender:self];
        }
    }
}

- (void) oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer
{
    // go back hole
    if(self.holePointer > 0)
    {
        NSLog(@"storing the score %i for hole %i", self.holeScore, [self actualHoleNumber]);
        [[LBDataManager sharedInstance] setScore: [NSNumber numberWithInt:self.holeScore] forHole: [NSNumber numberWithInt: self.holePointer]];
        [LBRestManager recordHole: [self actualHoleNumber] withScore: self.holeScore];
        self.holePointer--;
        NSLog(@"going to hole %i", [self actualHoleNumber]);
        if([[LBDataManager sharedInstance] getScoreForHole: [NSNumber numberWithInt: self.holePointer]])
        {
            [self setHoleScore: [[NSNumber numberWithInteger:[[LBDataManager sharedInstance] getScoreForHole: [NSNumber numberWithInt: self.holePointer]]] intValue]];
        }
        else
        {
            self.holeScore = 0;
        }
        [self loadHoleIntoView: [self.course courseHoleWithNumber:self.holePointer]];
    }
}

-(int) actualHoleNumber
{    
    return self.holePointer+1;
}

- (void) addGestureRecognisers
{
    
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
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

@end
