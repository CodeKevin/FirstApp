//
//  AppDelegate.m
//  Sdgift
//
//  Created by Kevin on 15/12/3.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "AppDelegate.h"
#import "WWSideslipViewController.h"
#import "LeftViewController.h"
#import "MainViewController.h"
#import "RightViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    MainViewController *mainVC = [[MainViewController alloc] init];
    RightViewController *rightVC = [[RightViewController alloc] init];
    
    WWSideslipViewController *slideVC = [[WWSideslipViewController alloc] initWithLeftView:leftVC andMainView:mainVC andRightView:rightVC andBackgroundImage:[UIImage imageNamed:@"bg"]];
    
    [slideVC setSpeedf:0.5];
    slideVC.sideslipTapGes.enabled = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:slideVC];
    nav.navigationBar.hidden = YES;
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
