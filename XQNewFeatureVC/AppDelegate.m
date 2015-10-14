//
//  AppDelegate.m
//  XQNewFeatureVC
//
//  Created by 徐强 on 15/10/13.
//  Copyright © 2015年 xuqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "XQNewFeatureVC.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    // 沙盒版本
    NSString *version =[NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"version.data"]];
    // app当前版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    
    if ([currentVersion isEqualToString:version]) {
        
        self.window.rootViewController = [[ViewController alloc] init];
    }else{
        
//        XQNewFeatureVC *newVc = [[XQNewFeatureVC alloc] initWithFeatureImagesNameArray:@[@"a",@"b",@"c"]];
        ViewController1 *vc1 = [ViewController1 new];
        ViewController2 *vc2 = [ViewController2 new];
        ViewController3 *vc3 = [ViewController3 new];
        XQNewFeatureVC *newVc = [[XQNewFeatureVC alloc] initWithFeatureControllerArray:@[vc1,vc2,vc3]];
        self.window.rootViewController = newVc;
        newVc.completeBlock = ^{
            self.window.rootViewController = [[ViewController alloc] init];
        };
        
        // 保存当前版本
//        [NSKeyedArchiver archiveRootObject:currentVersion toFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"version.data"]];
    }
    
    
    
    
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
