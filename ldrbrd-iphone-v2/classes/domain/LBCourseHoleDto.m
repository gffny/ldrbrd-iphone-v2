//
//  lbCourseHoleDto.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseHoleDto.h"

@implementation lbCourseHoleDto

@synthesize holeId;
@synthesize holeNumber;
@synthesize name;
@synthesize distance;
@synthesize description;
@synthesize imageId;

// initalise the hole with the course hole data
-(id) initWithHoleDetails: (NSDictionary *) courseHoleDictionary {
    // if the object is instantiated properly
    if ( self = [super init] ) {
        // and the course information is ok
        if(courseHoleDictionary) {
            // set the data
            [self setHoleId: courseHoleDictionary[@"id"]];
            [self setHoleNumber: [courseHoleDictionary[@"holeNumber"] longValue]];
            [self setName: courseHoleDictionary[@"name"]];
            [self setDistance: [courseHoleDictionary[@"holeDistance"] longValue]];
            [self setImageId: courseHoleDictionary[@"holeImageId"]];
            [self setDescription: courseHoleDictionary[@"holeDescription"]];
            
            //and return it
            return self;
        }
    }
    //otherwise return null
    return NULL;
}

@end
