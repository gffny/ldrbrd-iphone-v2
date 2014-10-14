//
//  LBDataManager.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBDataManager.h"
#import "LBScorecardDto.h"

@implementation LBDataManager

@synthesize scorecard;
@synthesize currentScoreArray;

@synthesize golferProfile;
@synthesize golfClubArray;
@synthesize newsItemArray;

@synthesize favouriteCourseArray;
@synthesize localCourseArray;
@synthesize courseInPlay;

+(LBDataManager*) sharedInstance
{
    //Singleton Pattern courtesy of http://www.raywenderlich.com/46988/ios-design-patterns
    static LBDataManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LBDataManager alloc] init];
    });
    return _sharedInstance;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        // set the the arrays!
    }
    return self;
}

-(void) initialiseCourse: (LBCourseDto *) course
{
    if(self)
    {
        courseInPlay = course;
        currentScoreArray = [[NSMutableArray alloc] initWithCapacity: course.courseHoleMap.count];
        for(int i=0;i<course.courseHoleMap.count;i++)
        {
            [currentScoreArray setObject:[NSNumber numberWithInt:0] atIndexedSubscript:i];
        }
    }
}

-(void) initialiseScorecard: (LBScorecardDto *)aScorecard
{
    if(self)
    {
        self.scorecard = aScorecard;
    }
}

-(BOOL) isInRound
{
    if(scorecard != NULL && currentScoreArray != NULL)
    {
        return YES;
    }
    return NO;
}

-(NSInteger) getScoreForHole: (NSNumber *) holeNumber
{
    if(currentScoreArray != NULL && [holeNumber intValue] <= currentScoreArray.count)
    {
        NSNumber *score = [currentScoreArray objectAtIndex: [holeNumber integerValue]];
        return [score integerValue];
    }
    return [[NSNumber numberWithInt: 0] integerValue];
}

-(void) setScore: (NSNumber *) holeScore forHole: (NSNumber *) holeNumber
{
    if(currentScoreArray == NULL) {
        currentScoreArray = [[NSMutableArray alloc] init];
    }
    [currentScoreArray replaceObjectAtIndex: [holeNumber integerValue] withObject: holeScore];
}

-(void) resetGolferScoreArray
{
    
}


@end
