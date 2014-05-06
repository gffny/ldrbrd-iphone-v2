//
//  LBDataManager.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBDataManager : NSObject

@property (nonatomic, strong) NSDictionary *currentRound;
@property (nonatomic, strong) NSDictionary *currentScorecard;
@property (nonatomic, strong) NSDictionary *golferProfile;
@property (nonatomic, strong) NSDictionary *golfClubArray;
@property (nonatomic, strong) NSDictionary *newsItemArray;
@property (nonatomic, strong) NSDictionary *favouriteCourseArray;
@property (nonatomic, strong) NSDictionary *localCourseArray;

+(LBDataManager*) sharedInstance;

-(BOOL) isInRound;

@end
