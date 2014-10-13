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

    [manager GET:[NSString stringWithFormat:@"%@health", restBaseURL] parameters:Nil success: success failure: failure];
}

-(void) asynchAuthenticateWithUsername:(NSString *) username andPassword:(NSString *) password withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager POST:[NSString stringWithFormat:@"http://localhost:8090/j_spring_security_check?j_username=%@&j_password=%@", username, password] parameters:Nil success:success failure:failure];

}

-(void) asynchStartScorecardOnCourse: (NSString *) courseId withSuccess: (void (^) (AFHTTPRequestOperation *operation, id responseObject))success failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager POST:[NSString stringWithFormat:@"http://localhost:8090/rest/scorecard/start?courseId=%@", courseId] parameters:Nil success:success failure:failure];

}

-(void) asynchSubmitScorecard:(NSArray *) scorecard andScorecardId:(NSString *) scorecardId withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    NSMutableDictionary *scorecardSubmission = [[NSMutableDictionary alloc] init];
    [scorecardSubmission setObject:scorecard forKey:@"scorecardArray"];
    [scorecardSubmission setObject:scorecardId forKey:@"scorecardId"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:scorecardSubmission options:kNilOptions error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"JSON String: %@", jsonString);

    [manager POST:@"http://localhost:8090/rest/scorecard/submit" parameters:scorecardSubmission success:success failure:failure];
}

-(void) asynchSgnScorecard:(NSString *) scorecardId withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    NSMutableDictionary *scorecardSubmission = [[NSMutableDictionary alloc] init];
    [scorecardSubmission setObject:scorecardId forKey:@"scorecardId"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:scorecardSubmission options:kNilOptions error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"JSON String: %@", jsonString);
    
    [manager POST:@"http://localhost:8090/rest/scorecard/sign" parameters:scorecardSubmission success:success failure:failure];

}

@end
