//
//  LBConstant.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/9/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const restPort = @":8090";
static NSString * const restContext = @"/ldrbrd";
static NSString * const restBaseURL = @"http://localhost";

static NSString * const localBaseURL = @"http://localhost:8090/ldrbrd/";
static NSString * const devbaseURL = @"http://localhost:8090/ldrbrd/";
static NSString * const liveBaseURL= @"http://localhost:8090/ldrbrd/";

@interface LBConstant : NSObject

@end
