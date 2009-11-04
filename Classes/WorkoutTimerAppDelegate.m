//
//  WorkoutTimerAppDelegate.m
//  WorkoutTimer
//
//  Created by Sue Brown on 11/3/09.
//  Copyright Sue and You 2009. All rights reserved.
//

#import "WorkoutTimerAppDelegate.h"
#import "WorkoutTimerViewController.h"

@implementation WorkoutTimerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
