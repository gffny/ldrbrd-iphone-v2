//
//  LBDataManager.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBDataManager.h"
#import "LBScorecard.h"

@interface LBDataManager ()

// hidden from other classes 
@property (nonatomic, retain) LBCourse *courseInPlay;

@end

@implementation LBDataManager

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

-(void) resetScorecardData
{
    
    _courseInPlay = NULL;
    _currentScoreArray = NULL;
    _scorecard = NULL;
}

-(void) initialiseCourse: (LBCourse *) course
{
    if(self)
    {
        _courseInPlay = course;
        _currentScoreArray = [self initialiseScoreArray: course.courseHoleList.count];
    }
}

-(LBCourse *) course
{
    if(_scorecard != NULL && _scorecard.course != NULL)
    {
        return _scorecard.course;
    }
    else
    {
        return _courseInPlay;
    }
}

-(BOOL) isInRound
{
    if(_scorecard != NULL && _currentScoreArray != NULL)
    {
        return YES;
    }
    return NO;
}

-(NSInteger) getScoreForHole: (NSNumber *) holeNumber
{
    if(_currentScoreArray != NULL && [holeNumber intValue] <= _currentScoreArray.count)
    {
        NSNumber *score = [_currentScoreArray objectAtIndex: [holeNumber integerValue]];
        return [score integerValue];
    }
    return [[NSNumber numberWithInt: 0] integerValue];
}

-(void) setScore: (NSNumber *) holeScore forHole: (NSNumber *) holeNumber
{
    if(_currentScoreArray == NULL) {
        if(_scorecard.course != NULL && _scorecard.course.courseHoleList != NULL) {
            _currentScoreArray = [self initialiseScoreArray: _scorecard.course.courseHoleList.count];
        } else {
            _currentScoreArray = [self initialiseScoreArray: 18];
        }
    }
    [_currentScoreArray replaceObjectAtIndex: [holeNumber integerValue] withObject: holeScore];
}

-(void) resetGolferScoreArray
{
    
}

-(NSMutableArray *) initialiseScoreArray: (long) size
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity: size];
    for(int i=0;i<size;i++)
    {
        [array setObject:[NSNumber numberWithInt:0] atIndexedSubscript:i];
    }
    return array;
}

@end
