//
//  LBRestFacade.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBRestFacade.h"
#import "LBConstant.h"

@implementation LBRestFacade

-(void) asynchBackendOnlineCheckWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    //Check if the backend is online
    
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];

    [manager GET:[NSString stringWithFormat:@"%@check/c_online", localBaseURL] parameters:Nil success: success failure: failure];
}

@end
