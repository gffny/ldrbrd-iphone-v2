//
//  LBRestFacade.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface LBRestFacade : NSObject

-(void) asynchBackendOnlineCheckWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
