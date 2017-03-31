//
//  AppDelegate.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXYDeviceModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self testBBB];
    
    return YES;
}

- (void)testBBB{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"txt"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *lineArray = [string componentsSeparatedByString:@"\n"];
    
    for (NSString *string in lineArray) {
        
        if ([string rangeOfString:@";"].location == NSNotFound) {
            NSLog(@"not found ; in string = %@",string);
        }
    }
    
}


- (void)testAAA{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"txt"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *lineArray = [string componentsSeparatedByString:@"\n"];
    
    NSMutableArray *allArray = [NSMutableArray array];
    for (NSString *string in lineArray) {
        
        NSRange range = [string rangeOfString:@"="];
        if (range.location != NSNotFound) {
            
            NSString *subString = [string substringToIndex:range.location];
            if (![self isContainObject:subString InArray:allArray]) {
                [allArray addObject:subString];
            }else{
                NSLog(@"string = %@",subString);
            }
        }
    }
}

- (BOOL)isContainObject:(NSString*)string InArray:(NSMutableArray*)ary {
    
    if ([ary containsObject:string]) {
        return YES;
    }
    return NO;
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
