//
//  lbCourseDto.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBCourseDto.h"
#import "LBCourseHoleDto.h"

@implementation LBCourseDto

@synthesize courseId;
@synthesize courseName;
@synthesize teeColour;
@synthesize courseImageRef;
@synthesize slopeIndex;
@synthesize courseHoleMap;

-(LBCourseHoleDto *) courseHoleWithNumber: (int) holeNumber {

    return [courseHoleMap objectAtIndex: holeNumber];
}

- (void) initCourseHoleMap:(NSDictionary *)holeMap
{
    courseHoleMap = [NSMutableArray array];
    for (int key = 0; key < holeMap.count; key++)
    {
        NSDictionary *hole = [holeMap objectForKey: [NSString stringWithFormat:@"%d", key]];
        if (hole != NULL) {
            [courseHoleMap addObject: [[LBCourseHoleDto alloc] initWithHoleDetails: hole]];
        } else {
            // TODO maybe handle this a little fucking better!
            NSLog(@"course hole is null!");
        }
    }
}

- (void) initCourseHoleList: (NSArray *) holeList
{
    courseHoleMap = [NSMutableArray array];
    for (int key = 0; key < holeList.count; key++)
    {
        NSDictionary *hole = [holeList objectAtIndex: key];
        if(hole != NULL)
        {
            [courseHoleMap addObject: [[LBCourseHoleDto alloc] initWithHoleDetails:hole]];
        } else
        {
            //TODO maybe handle this a little fucking better!
            NSLog(@"course hole is null");
        }
    }
    
}

-(id) initWithCourseDetails: (NSDictionary *) jsonResult
{
    // if the object is instantiated properly
    if ( self = [super init] ) {
        // and the course information is ok
        if(jsonResult) {
            // set the data
            [self setCourseId: jsonResult[@"idString"]];
            [self setCourseName: jsonResult[@"courseName"]];
            [self setTeeColour: jsonResult[@"teeColour"]];
            [self setCourseImageRef: jsonResult[@"courseImageRef"]];            
            [self setSlopeIndex: [jsonResult[@"slopeIndex"] doubleValue]];
            
            // loop through the course hole list?
            [self initCourseHoleList: jsonResult[@"courseHoleList"]];
            //and return it
            return self;
        }
    }
    //otherwise return null
    return NULL;
}

+ (id) courseWithProperties:(NSDictionary *)properties {
    LBCourseDto *course = [[self alloc] init];
    if(properties) {
        NSDictionary *courseHoleMap = properties[@"courseHoleMap"];
        for (NSString* key in courseHoleMap) {
            [course setCourseId: key];
            [course initHoleMap: [courseHoleMap objectForKey:key]];
        }
        [course setCourseName:@"Fresh Pond"];
        [course setTeeColour:@"White"];
    }
    return course;
}

- (void) initHoleMap:(NSDictionary *)holeMap {
    courseHoleMap = [NSMutableArray array];
    for (int key = 0; key < holeMap.count; key++) {
        NSDictionary *hole = [holeMap objectForKey: [NSString stringWithFormat:@"%d", key]];
        if (hole != NULL) {
            [courseHoleMap addObject: [[LBCourseHoleDto alloc] initWithHoleDetails: hole]];
        } else {
            // TODO maybe handle this a little fucking better!
            NSLog(@"course hole is null!");
        }
    }
}

-(BOOL) isNineHole {
    return !courseHoleMap.count == 18;
}

-(int) par {
    int coursePar = 0;
    for(int i=0;i<courseHoleMap.count;i++) {
        coursePar += ((LBCourseHoleDto*)[courseHoleMap objectAtIndex:i]).par;
    }
    return coursePar;
}

-(double) index {
    return slopeIndex;
}

@end
