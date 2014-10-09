//
//  LBRestManager.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/13/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBRestManager : NSObject

+(void) submitScorecard: (NSArray *) scoreArray forId: (NSString *) scorecardId;

+(void) recordHole: (int) holeNumber withScore: (int) score;

@end
