//
//  LBGolfShotProfiler.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/1/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBGolfShotProfiler.h"

@implementation LBGolfShotProfiler

+ (NSString *) profileShotWithPoints: (NSDictionary *) pointArray {
    // get the first and last x coordinates, and the first y coordinate (that will be the vertical line used to compare the flight of the "ball")
    
    // divine the n incremental points (probably 7) along the x-axis upon which the shot will be characterised
    
    // sequentially search through the pointsArray, to elicit the corresponding y-axis value for each intersection with the ball path
    
    // compare the 1xn matrix of the ball flight profile, to a list of 1xn array of previously characterised ball flight profiles (straight, draw, fade, hook, slice, etc) 
    
    return NULL;
}

@end
