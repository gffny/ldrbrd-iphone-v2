//
//  lbCourseDto.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCourseHoleDto.h"

@interface LBCourseDto : NSObject

@property (nonatomic) NSString *courseId;
@property (nonatomic) NSString *courseName;
@property (nonatomic) NSString *teeColour;
@property (nonatomic) int slopeIndex;
@property (nonatomic) NSString *courseImageRef;
@property (nonatomic) NSMutableArray *courseHoleMap;

-(LBCourseHoleDto *) courseHoleWithNumber: (int) holeNumber;

-(int) par;

-(int) index;

-(BOOL) isNineHole;

-(id) initWithCourseDetails: (NSDictionary *) jsonResult;

-(void) initCourseHoleMap: (NSDictionary *) holeMap;

+(id)courseWithProperties:(NSDictionary *)properties;

@end
