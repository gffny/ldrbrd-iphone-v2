//
//  lbCourseHoleDto.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBCourseHoleDto : NSObject

@property (nonatomic) NSString *holeId;
@property (nonatomic) long holeNumber;
@property (nonatomic) NSString *name;
@property (nonatomic) long distance;
@property (nonatomic) long par;
@property (nonatomic) long index;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *imageId;

-(id) initWithHoleDetails: (NSDictionary *) courseHoleDictionary;

@end
