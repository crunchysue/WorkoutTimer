//
//  WorkoutTimerViewController.m
//  WorkoutTimer
//
//  Created by Sue Brown on 11/3/09.
//  Copyright Sue and You 2009. All rights reserved.
//

#import "WorkoutTimerViewController.h"

const int TIMER_INTERVAL = 5.0;

@implementation WorkoutTimerViewController


// this starts the timer now, instead of starting the song.
- (IBAction) startTimer {
	[self stopTimer];
	theTimer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL target:self selector:@selector(playWorkMusic:) userInfo:nil repeats:NO];
	[theTimer retain];
}

- (void) playWorkMusic: (NSTimer *) timer {
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/audiofile.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (audioPlayer == nil)
		NSLog(@"Error: %@", error);
	else
		[audioPlayer play];
}

- (IBAction) stopTimer {
	
	if (theTimer) {
		[theTimer invalidate];
		[theTimer release];
		theTimer = nil;
	}
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if (theTimer) {
		[theTimer invalidate];
		[theTimer release];
		theTimer = nil;
	}
	[audioPlayer release];
    [super dealloc];
}

@end
