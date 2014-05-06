//
//  LBDataManager.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBDataManager.h"

@implementation LBDataManager

@synthesize currentRound;
@synthesize currentScorecard;
@synthesize golferProfile;
@synthesize golfClubArray;
@synthesize newsItemArray;
@synthesize favouriteCourseArray;
@synthesize localCourseArray;

+(LBDataManager*) sharedInstance
{
    //Singleton Pattern courtesy of http://www.raywenderlich.com/46988/ios-design-patterns
    static LBDataManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{_sharedInstance = [[LBDataManager alloc] init];
    });
    return _sharedInstance;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        // set the the arrays!
    }
    return self;
}

-(BOOL) isInRound
{
    if(currentRound != NULL && currentScorecard != NULL)
    {
        return YES;
    }
    return NO;
}

@end
