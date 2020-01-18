//
//  AppDelegate.m
//  FrankApp
//
//  Created by Henrik Frank on 2020-01-09.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@import Firebase;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Use Firebase library to configure APIs
    UITabBar.appearance.barTintColor = [UIColor blackColor];
    UITabBar.appearance.tintColor = [UIColor cyanColor];
    [FIRApp configure];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
