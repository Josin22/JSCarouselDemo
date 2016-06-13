//
//  AppDelegate.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "AppDelegate.h"
#import "JSCarouselViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    JSCarouselViewController *carouselVC = [[JSCarouselViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:carouselVC];
    
    self.window.rootViewController = nav;
    
    return YES;
}


@end
