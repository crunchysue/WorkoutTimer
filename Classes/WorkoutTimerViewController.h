//
//  WorkoutTimerViewController.h
//  WorkoutTimer
//
//  Created by Sue Brown on 11/3/09.
//  Copyright Sue and You 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WorkoutTimerViewController : UIViewController {
	AVAudioPlayer *audioPlayer;
	NSTimer *theTimer;
}

- (void) playWorkMusic: (NSTimer *)timer;
- (IBAction) startTimer;
- (IBAction) stopTimer;

@end

