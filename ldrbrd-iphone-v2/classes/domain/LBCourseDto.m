//
//  lbCourseDto.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseDto.h"
#import "lbCourseHoleDto.h"

@implementation lbCourseDto

@synthesize courseId;
@synthesize courseName;
@synthesize par;
@synthesize isNineHole;
@synthesize teeColour;
@synthesize courseImageRef;
@synthesize slopeIndex;
@synthesize courseHoleMap;

- (void) initCourseHoleMap:(NSDictionary *)holeMap {
    courseHoleMap = [NSMutableArray array];
    int holeCount = 18;
    if( isNineHole) {
        holeCount = 9;
    }
    for (int key = 0; key < holeCount; key++) {
        NSDictionary *hole = [holeMap objectForKey: [NSString stringWithFormat:@"%d", key]];
        if (hole != NULL) {
            [courseHoleMap addObject: [[lbCourseHoleDto alloc] initWithHoleDetails: hole]];
        } else {
            // TODO maybe handle this a little fucking better!
            NSLog(@"course hole is null!");
        }
    }
    NSLog(@"I'm here!");
}

-(id) initWithCourseDetails: (NSDictionary *) jsonResult {
    // if the object is instantiated properly
    if ( self = [super init] ) {
        // and the course information is ok
        if(jsonResult) {
            // set the data
            [self setCourseId: jsonResult[@"id"]];
            [self setCourseName: jsonResult[@"courseName"]];
            [self setPar: [jsonResult[@"par"] longValue]];
            if([self par] > 37) {
                [self setIsNineHole: FALSE];
            } else {
                [self setIsNineHole: TRUE];
            }
            [self setTeeColour: jsonResult[@"teeColour"]];
            [self setCourseImageRef: jsonResult[@"courseImageRef"]];            
            [self setSlopeIndex: [jsonResult[@"slopeIndex"] doubleValue]];
            //and return it
            return self;
        }
    }
    //otherwise return null
    return NULL;
}

@end
