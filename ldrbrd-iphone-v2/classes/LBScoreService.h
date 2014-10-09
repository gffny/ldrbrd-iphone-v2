//
//  LBScoreService.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 8/29/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface LBScoreService : NSObject

-(void) asynchRetrieveCourseList:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

-(void) asychStartGeneralScorecard:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

-(void) asychScoreHole:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
