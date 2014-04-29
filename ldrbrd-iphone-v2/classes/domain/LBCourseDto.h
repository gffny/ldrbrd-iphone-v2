//
//  lbCourseDto.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lbCourseDto : NSObject

@property (nonatomic) NSString *courseId;
@property (nonatomic) NSString *courseName;
@property (nonatomic) long par;
@property (nonatomic) BOOL isNineHole;
@property (nonatomic) NSString *teeColour;
@property (nonatomic) double slopeIndex;
@property (nonatomic) NSString *courseImageRef;
@property (nonatomic) NSMutableArray *courseHoleMap;

-(id) initWithCourseDetails: (NSDictionary *) jsonResult;

-(void) initCourseHoleMap: (NSDictionary *) holeMap;

@end
