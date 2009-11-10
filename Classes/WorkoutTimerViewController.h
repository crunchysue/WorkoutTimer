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
	UISlider *intervalSlider;
	UILabel *intervalLabel;
}

@property (nonatomic, retain) IBOutlet UISlider *intervalSlider;
@property (nonatomic, retain) IBOutlet UILabel *intervalLabel;

- (void) toggleMusic: (NSTimer *)timer;
- (IBAction) startTimer;
- (IBAction) stopTimer;
- (IBAction) setInterval: (UISlider *) sender;

@end

