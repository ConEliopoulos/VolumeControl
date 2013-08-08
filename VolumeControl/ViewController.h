//
//  ViewController.h
//  VolumeControl
//
//  Created by Con Eliopoulos on 8/08/13.
//  Copyright (c) 2013 Con Eliopoulos. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

/* Declare our AVAudioPlayer which we will use to play our music. */
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

/* Declare our volume sliders. */
@property (weak, nonatomic) IBOutlet UISlider *linearVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *exponentialVolumeSlider;

/* Manange our audio playback. */
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;

/* Manage our volume. */
- (IBAction)changeVolumeLinear:(id)sender;
- (IBAction)changeVolumeExponential:(id)sender;

@end
