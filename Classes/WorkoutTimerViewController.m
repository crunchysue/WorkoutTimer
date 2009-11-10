//
//  WorkoutTimerViewController.m
//  WorkoutTimer
//
//  Created by Sue Brown on 11/3/09.
//  Copyright Sue and You 2009. All rights reserved.
//

#import "WorkoutTimerViewController.h"

int iTimerInterval = 15;
static int iMusicIsPlaying = 0; // cycles between 0 (off) and 1 (on) - effectively a boolean


@implementation WorkoutTimerViewController

@synthesize intervalLabel;
@synthesize intervalSlider;



- (IBAction) setInterval: (UISlider *) sender {	
	 
	int val = (int) sender.value;
	intervalLabel.text = [NSString stringWithFormat:@"%u", val];
	
	iTimerInterval = val;

}


// this starts the timer now, instead of starting the song.
- (IBAction) startTimer {
	//[self stopTimer];
	theTimer = [NSTimer scheduledTimerWithTimeInterval:iTimerInterval target:self selector:@selector(toggleMusic:) userInfo:nil repeats:YES];
	[theTimer retain];
}

- (void) toggleMusic: (NSTimer *) timer {
	
	if (audioPlayer) {			
		if (iMusicIsPlaying == 1) {
			[audioPlayer stop];
			iMusicIsPlaying = 0;
		} else {
			[audioPlayer play];
			iMusicIsPlaying = 1;
		}
	}
}

- (IBAction) stopTimer {
	
	[audioPlayer stop];
	
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/audiofile.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (error)
		NSLog(@"Error Description Here: %@", error.description);	
	
	intervalLabel.text = [NSString stringWithFormat:@"%u", iTimerInterval];
						  
						  
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
