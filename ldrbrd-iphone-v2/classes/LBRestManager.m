//
//  LBRestManager.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/13/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBRestManager.h"
#import "LBDataManager.h"

@implementation LBRestManager

+(void) submitScorecard: (NSArray *) scoreArray forId: (NSString *) scorecardId
{
    
}

+(void) recordHole: (int) holeNumber withScore: (int) score
{
    // TODO: handle the record score
    NSLog([NSString stringWithFormat:@"Persisting to the central web. Hole Number: %i | Score: %i", holeNumber, score]);
}

@end
