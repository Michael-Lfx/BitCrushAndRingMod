//
//  ViewController.h
//  BitCrushAndRingMod
//
//  Created by Brian Wang on 10/25/14.
//  Copyright (c) 2014 BW Innovation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPOscilloscopeLayer;

@interface ViewController : UIViewController

@property (strong, nonatomic) TPOscilloscopeLayer *inputOscilloscopeLayer;
@property (strong, nonatomic) TPOscilloscopeLayer *outputOscilloscopeLayer;

@property (strong, nonatomic) IBOutlet UISlider *inputGainSlider;
@property (strong, nonatomic) IBOutlet UISlider *bcResolutionSlider;
@property (strong, nonatomic) IBOutlet UISlider *bcBitDepthSlider;
@property (strong, nonatomic) IBOutlet UISlider *rmFrequencySlider;
@property (strong, nonatomic) IBOutlet UISegmentedControl *rmWaveTypeSegmentedControl;
@property (strong, nonatomic) IBOutlet UISlider *outputVolSlider;

@property (strong, nonatomic) IBOutlet UILabel *inputGainLabel;
@property (strong, nonatomic) IBOutlet UILabel *bcResolutionLabel;
@property (strong, nonatomic) IBOutlet UILabel *bcBitDepthLabel;
@property (strong, nonatomic) IBOutlet UILabel *rmFrequencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *outputVolLabel;

@end

