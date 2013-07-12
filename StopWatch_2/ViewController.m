//
//  ViewController.m
//  StopWatch_2
//
//  Created by Sonam Dhingra on 5/3/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *stopButtonSound;
    AVAudioPlayer *startButtonSound;
}
@property (strong,nonatomic) UIColor *changeStateColor;

@end

@implementation ViewController

//syntheseise properties declared in .h
@synthesize timerLabel,ticks, timer;
@synthesize stopButton, startButton, resetButton;
@synthesize changeStateColor;



//set up the Start Button ACTION
-(IBAction)startTapped: (UIButton *) sender {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                  target:self
                                                 selector:@selector (timerActivity)
                                                 userInfo:Nil
                                                 repeats:YES];
    
    //Add Sound
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/ThisIsOurTimeUpdate.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
    startButtonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	startButtonSound.numberOfLoops = 0;
	
	if (startButtonSound== nil)
		NSLog(@"error");
	else
		[startButtonSound play];

    
}



#pragma mark set up Timer
-(void)timerActivity {
    
    ticks +=.1;
    double seconds = fmod(ticks, 60.0);
    double minutes = fmod(trunc(ticks / 60.0), 60.0);
    double hours = trunc(ticks / 3600.0);
    self.timerLabel.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%04.1f", hours, minutes, seconds];
  
}


#pragma mark
//Define what Stop button will do

-(IBAction)stopTapped:(UIButton *) sender {
    
    [startButtonSound stop];
    [self.timer invalidate];
    
     self.timer=Nil;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/horn_effect.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
    stopButtonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	stopButtonSound.numberOfLoops = 0;
	
	if (stopButtonSound== nil)
		NSLog(@"error");
	else
		[stopButtonSound play];
    

}

#pragma mark 
//Define what Reset button will do
-(IBAction)resetTapped:(UIButton *) sender {
    
    [self.timer invalidate];
    [stopButtonSound stop];
    
    
    NSTimer *newTimer= [NSTimer scheduledTimerWithTimeInterval:.1
                                                       target:self
                                                        selector:@selector (resetTimer)
                                                        userInfo:Nil
                                                       repeats:YES];
    self.timer=newTimer;
    
    
}

#pragma mark reset Timer

-(void)resetTimer {
    
    ticks =0;
    double seconds = fmod(ticks, 60.0);
    double minutes = fmod(trunc(ticks / 60.0), 60.0);
    double hours = trunc(ticks / 3600.0);
    self.timerLabel.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%04.1f", hours, minutes, seconds];
    
    
    [self.timer invalidate];
    
}

#pragma mark 

- (void)viewDidLoad

{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
