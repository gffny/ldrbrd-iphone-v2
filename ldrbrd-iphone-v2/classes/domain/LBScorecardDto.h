//
//  LBScorecard.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 10/13/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBScorecardDto : NSObject

@property NSString *scorecardId;
@property NSString *golferId;
@property NSString *courseDocumentId;
@property LBCourseDto *course;
@property NSString *roundDate;
@property NSString *handicap;
@property NSString *conditions;
@property NSString *scorecardNotes;

@end
