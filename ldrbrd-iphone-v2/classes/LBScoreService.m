//
//  LBScoreService.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 8/29/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBScoreService.h"
#import "LBConstant.h"

@implementation LBScoreService

-(void) asynchRetrieveCourseList:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager GET:[NSString stringWithFormat:@"%@course/testlist", restBaseURL] parameters:Nil success: success failure: failure];
}

-(void) asychStartGeneralScorecard:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    
}

-(void) asychScoreHole:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    //Check if the backend is online
    
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager GET:[NSString stringWithFormat:@"%@course/testlist", restBaseURL] parameters:Nil success: success failure: failure];
}

@end
