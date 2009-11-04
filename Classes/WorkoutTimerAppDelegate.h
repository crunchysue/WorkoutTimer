//
//  WorkoutTimerAppDelegate.h
//  WorkoutTimer
//
//  Created by Sue Brown on 11/3/09.
//  Copyright Sue and You 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WorkoutTimerViewController;

@interface WorkoutTimerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WorkoutTimerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WorkoutTimerViewController *viewController;

@end

