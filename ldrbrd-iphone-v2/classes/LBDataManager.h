//
//  LBDataManager.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCourseDto.h"

@interface LBDataManager : NSObject

/* SCORECARD INFO */
@property (nonatomic, strong) NSString *scorecardId;
@property (nonatomic, strong) NSMutableArray *currentScoreArray;

/* GOLFER INFO */
@property (nonatomic, strong) NSDictionary *golferProfile;
@property (nonatomic, strong) NSDictionary *golfClubArray;
@property (nonatomic, strong) NSDictionary *newsItemArray;

/* COURSE INFO */
@property (nonatomic, strong) NSDictionary *favouriteCourseArray;
@property (nonatomic, strong) NSDictionary *localCourseArray;
@property (nonatomic, strong) LBCourseDto *courseInPlay;

/* SINGLETON FACTORY METHODS */
+(LBDataManager*) sharedInstance;

/* SCORECARD METHODS */
-(void) initialiseCourse: (LBCourseDto *) course;
-(void) initialiseScorecardId: (NSString *) newScorecardId;
-(BOOL) isInRound;
-(NSInteger) getScoreForHole: (NSNumber *) holeNumber;
-(void) setScore: (NSNumber *) holeScore forHole: (NSNumber *) holeNumber;
-(void) resetGolferScoreArray;


@end
