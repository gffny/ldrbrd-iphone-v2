//
//  LBRestFacade.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBRestFacade.h"
#import "LBDataManager.h"
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

-(void) asynchAuthenticateWithUsername:(NSString *) username andPassword:(NSString *) password withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successMethod failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager POST:[NSString stringWithFormat:@"%@j_spring_security_check?j_username=%@&j_password=%@", localBaseURL, username, password] parameters:Nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // do post login, load user profile, etc
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager setRequestSerializer: requestSerializer];

        [manager POST:[NSString stringWithFormat:@"%@profile/digest", restBaseURL] parameters:Nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *golferDigest = (NSDictionary*)responseObject;
            
            NSDictionary *golfer = [golferDigest dictionaryForKey:@"golfer"];
            NSArray *favouriteCourseList;
            NSArray *lastXScorecardList;
            NSArray *upcomingCompetitionEntryList;
            NSArray *upcomingNonCompetitionRoundList;
            NSObject *hasActiveScorecard = [golferDigest objectForKey:@"hasActiveScorecard"];
            
            // initialise the following objects
//            favouriteCourseList = ();
//            golfer = {
//                    emailAddress = "gaffney.ie@gmail.com";
//                    enabled = 1;
//                    failedLoginAttemptsCount = 0;
//                    favouriteCourseList = "<null>";
//                    firstName = John;
//                    handDominanceValue = RIGHT;
//                    handedness = RIGHT;
//                    handicap = 26;
//                    id = 1;
//                    idString = 1;
//                    lastLogin = "<null>";
//                    lastLoginDT = "<null>";
//                    lastName = Gaffney;
//                    password = "<null>";
//                    profileHandle = gffny;
//                    profileImageRef = "<null>";
//            };
//            lastXScorecardList = ( );
//            upcomingCompetitionEntryList = ( );
//            upcomingNonCompetitionRoundList = ( );

            [[LBDataManager sharedInstance] initialiseScorecard: nil];
            successMethod(operation, responseObject);
        }
        failure:failure];
        
    } failure:failure];

}

-(void) asynchStartScorecardOnCourse: (NSString *) courseId withSuccess: (void (^) (AFHTTPRequestOperation *operation, id responseObject))success failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //TODO Make the following four lines into a method
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager setRequestSerializer: requestSerializer];
    
    [manager POST:[NSString stringWithFormat:@"%@start?courseId=%@", restScorecardURL, courseId] parameters:Nil success:success failure:failure];
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

    [manager POST:[NSString stringWithFormat: @"%@submit", restScorecardURL] parameters:scorecardSubmission success:success failure:failure];
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
    
    [manager POST:[NSString stringWithFormat:@"%@sign", restScorecardURL] parameters:scorecardSubmission success:success failure:failure];

}

@end
