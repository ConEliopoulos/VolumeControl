//
//  ViewController.m
//  VolumeControl
//
//  Created by Con Eliopoulos on 8/08/13.
//  Copyright (c) 2013 Con Eliopoulos. All rights reserved.
//

#import "ViewController.h"

/* Define a constant for our exponent.
 * Note: Changes to this value defines the shape of the exponential curve.
 * Higher values have a more pronounced effect, while lower values have
 * a more linear effect.
 */
#define kExponent 4

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    /* Get the file path to our audio file. */
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Funky" ofType:@"aif"]];
    
    /* Initialise audioPlayer with our file and check for errors. */
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    }
    else
    {
        /* If there are no errors, we can get our audioPlayer ready to play our music. */
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender
{
    /* Loop our music until it is stopped. */
    [self.audioPlayer setNumberOfLoops:-1];
    
    /* Play our music. */
    [self.audioPlayer play];
}

- (IBAction)stop:(id)sender
{
    /* Stop our music. */
    [self.audioPlayer stop];
}

- (IBAction)changeVolumeLinear:(id)sender
{
    if (self.audioPlayer != nil)
    {
        /* We are making linear changes to the volume.
         * Set the volume to the value of the linear slider.
         */
        self.audioPlayer.volume = self.linearVolumeSlider.value;
        
        /* We want to visualize the difference between linear and exponential changes.
         * Use our (almost) exponential solution to set the value of the exponential slider.
         */
        self.exponentialVolumeSlider.value = (pow(self.linearVolumeSlider.value, kExponent));
    }
}

- (IBAction)changeVolumeExponential:(id)sender
{
    if (self.audioPlayer != nil)
    {
        /* Calculate the (almost) exponential volume. */
        double newVolume = (pow(self.exponentialVolumeSlider.value, kExponent));
        
        /* Set the volume to the result of our (almost) exponential calculation.
         * Note: We are only applying the calculation when we set the volume. We are
         * not changing the value of the exponential slider.
         */
        self.audioPlayer.volume = newVolume;
        
        /* We want to visualize the difference between linear and exponential changes.
         * Use our (almost) exponential solution to set the value of the linear slider.
         */
        self.linearVolumeSlider.value  = newVolume;
    }
}

@end
