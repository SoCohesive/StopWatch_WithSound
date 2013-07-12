//
//  ViewController.h
//  StopWatch_2
//
//  Created by Sonam Dhingra on 5/3/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Declare timer and TimeIntervals that timer will use

@property (weak,nonatomic) NSTimer *timer;
@property (nonatomic) CFTimeInterval ticks;

// Declare OutLets

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak,nonatomic) IBOutlet UIButton *stopButton;
@property (weak,nonatomic) IBOutlet UIButton *startButton;
@property (weak,nonatomic) IBOutlet UIButton *resetButton;



//Methods & Actions

- (IBAction)startTapped:(UIButton *)sender;
- (IBAction)stopTapped:(UIButton * )sender;
- (IBAction)resetTapped:(id)sender;
-(void) timerActivity;
-(void) resetTimer;




@end
