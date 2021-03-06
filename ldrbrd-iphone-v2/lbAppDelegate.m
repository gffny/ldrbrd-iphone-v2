//
//  lbAppDelegate.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 3/26/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbAppDelegate.h"
#import "LBDataManager.h"
#import "UIColor+lbColours.h"

@implementation lbAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initialiseAppData];
//    [self initializeGoogleMapsApi];
//    [self initializeStyling];
//    [self initializeReachability];
//    [self initializeLocalization];
//    [self initializeTracking];
//    [self initializeCrashReporting];
//    [self initializeRating];
    return YES;
}

- (void) initialiseAppData
{
    //create instance of datamanager
    [LBDataManager sharedInstance];
}

- (void)initializeStyling
{
//    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
//    tabBarController.tabBar.selectedImageTintColor = [UIColor lbBlueColour];
//    [[UISearchBar appearance] setBarTintColor:[UIColor lbGreyColour]];
//    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor lbBlueColour]];
//    [[UILabel appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor lbBlueColour]];
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage alloc]];
//    [[UITabBarItem appearance] setTitleTextAttributes:
//     @{ NSForegroundColorAttributeName: [UIColor lbBlueColour],
//        NSFontAttributeName: [UIFont preferredFontForTextStyle: UIFontTextStyleCaption2]}
//                                             forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:
//     @{ NSForegroundColorAttributeName: [UIColor lbBlueColour],
//        NSFontAttributeName: [UIFont preferredFontForTextStyle: UIFontTextStyleCaption2]}
//                                             forState:UIControlStateSelected];
//    self.window.tintColor = [UIColor lbBlueColour];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
