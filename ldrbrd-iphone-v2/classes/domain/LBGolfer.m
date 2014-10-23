//
//  LBGolfer.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 10/14/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBGolfer.h"

@implementation LBGolfer

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{ @"id" : @"golferId",
               @"idString" : @"idString",
               @"firstName" : @"firstName",
               @"lastName" : @"lastName",
               @"password" : @"password",
               @"emailAddress" : @"emailAddress",
               @"profileHandle" : @"profileHandle",
               @"profileImageRef" : @"profileImageRef",
               @"failedLoginAttemptsCount" : @"failedLoginAttemptsCount",
               @"favouriteCourseList" : @"favouriteCourseList",
               @"handDominanceValue" : @"handDominanceValue",
               @"handedness" : @"handedness",
               @"handicap" : @"handicap",
               @"lastLogin" : @"lastLogin",
               @"lastLoginDT" : @"lastLoginDT",
               @"enabled" : @"enabled"
            }];
}

@end
