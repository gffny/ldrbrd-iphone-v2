//
//  LBStartRoundVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 10/10/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBStartRoundVC.h"
#import "LBLocationManager.h"
#import "LBDataManager.h"
#import "LBDummyData.h"
#import "LBRestFacade.h"
#import "LBPlayGolfVC.h"
#import "LBScoreService.h"

@interface LBStartRoundVC ()

@end

NSMutableArray *courseList;

@implementation LBStartRoundVC

@synthesize coursePicker;
@synthesize courseName;
@synthesize parValue;
@synthesize teeColourValue;
@synthesize indexValue;
@synthesize descriptionValue;
@synthesize handicapField;
@synthesize previousScrollViewYOffset;

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
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 1000)];
    [scroller setDelegate:self];
    [handicapField setDelegate:self];
    
    [[[LBScoreService alloc] init] asynchRetrieveCourseList:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Retrieve Success %@", operation.responseString);
        if([responseObject isKindOfClass:[NSArray class]]) {
            // list of courses
            courseList = responseObject;
            [coursePicker reloadAllComponents];
            [self updateCourseInfo: [courseList objectAtIndex:0]];
            // todo update the dropdown menu of courses with the data here
        } else if ([responseObject isKindOfClass: [NSDictionary class]]) {
            // single course
            // todo update the course data in the view and disable the dropdown
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Retrieve Failure");
        // todo eh aaah
    }];
    [self setPreviousScrollViewYOffset: 1.0f];
    CGRect frameRect = handicapField.frame;
    frameRect.size.height = 50;
    handicapField.frame = frameRect;
    [self.playGolfBtn addTarget:self action:@selector(playNowBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if(courseList != NULL) {
        return courseList.count;
    } else {
        return 0;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if(courseList != NULL) {
        return [[courseList objectAtIndex:row] valueForKey:@"name"];
    } else {
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog([NSString stringWithFormat:@"Row Number %ld", row]);
    if(courseList != NULL) {
        [self updateCourseInfo: [courseList objectAtIndex: row]];
    }
}

-(void) updateCourseInfo: (NSDictionary *)course
{
    if(course != NULL) {
        [courseName setText: [self stringValueForCourse:course AndKey:@"name"]];
        [parValue setText: [self stringValueForCourse:course AndKey:@"par"]];
        [teeColourValue setText: [self stringValueForCourse:course AndKey:@"teeColour"]];
        [indexValue setText: [self stringValueForCourse:course AndKey:@"slopeIndex"]];
        [descriptionValue setText: @"name"];
    }
}

-(NSString *)stringValueForCourse: (NSDictionary *)course AndKey: (NSString *)key
{
    return [NSString stringWithFormat:@"%@", [course valueForKey: key]];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    UIViewController *destVc = [segue destinationViewController];
    if([destVc isKindOfClass: [LBPlayGolfVC class]])
    {
        LBPlayGolfVC *playGolfVC = (LBPlayGolfVC *)destVc;
        [playGolfVC loadCourseInView: [[LBCourseDto alloc] initWithCourseDetails: [courseList objectAtIndex: [coursePicker selectedRowInComponent:0]]]];
    }
    // Pass the selected object to the new view controller.
}

- (void)playNowBtnClckd:(UIButton *)sender
{
    NSLog(@"play now button clicked");
    NSString *courseId = [[[LBCourseDto alloc] initWithCourseDetails: [courseList objectAtIndex: [coursePicker selectedRowInComponent:0]]] courseId];
    [[[LBRestFacade alloc] init] asynchStartScorecardOnCourse: courseId withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString *scorecardId = [responseObject valueForKey: @"idString"];
            NSLog(@"Start Scorecard Success %@", scorecardId);
            [[LBDataManager sharedInstance] initialiseScorecardId: scorecardId];
            [self performSegueWithIdentifier:@"seg_plyrnd" sender:self];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Start Scorecard Failure");
    }];
}

// Methods for UIScrollViewDelegate that enable the auto hide of the nav bar upon scrolling


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.navigationController.navigationBar.frame;
    CGFloat size = frame.size.height - 21;
    CGFloat framePercentageHidden = ((20 - frame.origin.y) / (frame.size.height - 1));
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGFloat scrollDiff = scrollOffset - self.previousScrollViewYOffset;
    CGFloat scrollHeight = scrollView.frame.size.height;
    CGFloat scrollContentSizeHeight = scrollView.contentSize.height + scrollView.contentInset.bottom;
    
    if (scrollOffset <= -scrollView.contentInset.top) {
        frame.origin.y = 20;
    } else if ((scrollOffset + scrollHeight) >= scrollContentSizeHeight) {
        frame.origin.y = -size;
    } else {
        frame.origin.y = MIN(20, MAX(-size, frame.origin.y - scrollDiff));
    }
    
    [self.navigationController.navigationBar setFrame:frame];
    [self updateBarButtonItems:(1 - framePercentageHidden)];
    self.previousScrollViewYOffset = scrollOffset;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self stoppedScrolling];
    }
}

- (void)stoppedScrolling
{
    CGRect frame = self.navigationController.navigationBar.frame;
    if (frame.origin.y < 20) {
        [self animateNavBarTo:-(frame.size.height - 21)];
    }
}

- (void)updateBarButtonItems:(CGFloat)alpha
{
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    self.navigationItem.titleView.alpha = alpha;
    self.navigationController.navigationBar.tintColor = [self.navigationController.navigationBar.tintColor colorWithAlphaComponent:alpha];
}

- (void)animateNavBarTo:(CGFloat)y
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = self.navigationController.navigationBar.frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        frame.origin.y = y;
        [self.navigationController.navigationBar setFrame:frame];
        [self updateBarButtonItems:alpha];
    }];
}

// handle the keyboard - move the display up so the text input for handicap can be seen
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    if(textField == self.handicapField)
//    {
//        [self.handicapField becomeFirstResponder];
//    }
//    else
    if(textField == self.handicapField){
        [self.handicapField resignFirstResponder];
        CGPoint bottomOffset = CGPointMake(0, 0);
        [scroller setContentOffset:bottomOffset animated:YES];
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.handicapField)
    {
        CGPoint bottomOffset = CGPointMake(0, 700);
        [scroller setContentOffset:bottomOffset animated:YES];
    }
}

@end
