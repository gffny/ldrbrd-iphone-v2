//
//  LBScorecardUtils.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/12/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBCourseDto.h"

@interface LBScorecardUtils : NSObject

+(int) countScore: (NSArray*) scoreArray;

+(int) countBelowPar: (NSArray*) scoreArray onCourse: (LBCourseDto *) course;

+(int) countBogeyPlus: (NSArray*) scoreArray onCourse: (LBCourseDto *) course;

+(int) countBogey: (NSArray*) scoreArray onCourse: (LBCourseDto *) course;

+(int) countPar: (NSArray*) scoreArray onCourse: (LBCourseDto *) course;

@end
