//
//  ViewController.m
//  BitCrushAndRingMod
//
//  Created by Brian Wang on 10/25/14.
//  Copyright (c) 2014 BW Innovation. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TPOscilloscopeLayer.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.inputOscilloscopeLayer = [[TPOscilloscopeLayer alloc] initWithAudioController:[[AppDelegate sharedInstance] audioController]];
    self.inputOscilloscopeLayer.frame = CGRectMake(10.0, 10.0, 220.0, 40.0);
    [self.view.layer addSublayer:self.inputOscilloscopeLayer];
    [[[AppDelegate sharedInstance] audioController] addInputReceiver:self.inputOscilloscopeLayer];
    [self.inputOscilloscopeLayer start];
    
    self.outputOscilloscopeLayer = [[TPOscilloscopeLayer alloc] initWithAudioController:[[AppDelegate sharedInstance] audioController]];
    self.outputOscilloscopeLayer.frame = CGRectMake(240.0, 10.0, 220.0, 40.0);
    [self.view.layer addSublayer:self.outputOscilloscopeLayer];
    [[[AppDelegate sharedInstance] audioController] addOutputReceiver:self.outputOscilloscopeLayer];
    [self.outputOscilloscopeLayer start];
    
    self.inputGainSlider.value = 20 * log10([[[AppDelegate sharedInstance] audioController] inputGain]);
    [self.inputGainLabel setText:[NSString stringWithFormat:@"%.2f", 20 * log10([[[AppDelegate sharedInstance] audioController] inputGain])]];
    self.outputVolSlider.value = 20 * log10([[[AppDelegate sharedInstance] audioController] masterOutputVolume]);
    [self.outputVolLabel setText:[NSString stringWithFormat:@"%.2f", 20 * log10([[[AppDelegate sharedInstance] audioController] masterOutputVolume])]];
    self.bcResolutionSlider.value = [[AppDelegate sharedInstance] bcResolution];
    [self.bcResolutionLabel setText:[NSString stringWithFormat:@"%.2f", [[AppDelegate sharedInstance] bcResolution]]];
    self.bcBitDepthSlider.value = [[AppDelegate sharedInstance] bcBitDepth];
    [self.bcBitDepthLabel setText:[NSString stringWithFormat:@"%.2f", [[AppDelegate sharedInstance] bcBitDepth]]];
    self.rmFrequencySlider.value = [[AppDelegate sharedInstance] rmFrequency];
    [self.rmFrequencyLabel setText:[NSString stringWithFormat:@"%.2f", [[AppDelegate sharedInstance] rmFrequency]]];
    self.rmWaveTypeSegmentedControl.selectedSegmentIndex = [[AppDelegate sharedInstance] rmWaveType];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputGainSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [[[AppDelegate sharedInstance] audioController] setInputGain:pow(10.0, slider.value / 20.0)];
    [self.inputGainLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
}

- (IBAction)bcResolutionSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [[AppDelegate sharedInstance] setBcResolution:slider.value];
    [self.bcResolutionLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
}

- (IBAction)bcBitDepthSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [[AppDelegate sharedInstance] setBcBitDepth:slider.value];
    [self.bcBitDepthLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
}

- (IBAction)rmFrequencySliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [[AppDelegate sharedInstance] setRmFrequency:slider.value];
    [self.rmFrequencyLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
}

- (IBAction)rmWaveTypeSliderValueChanged:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    int value = (int)control.selectedSegmentIndex;
    [[AppDelegate sharedInstance] setRmWaveType:value];
}

- (IBAction)outputVolSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [[[AppDelegate sharedInstance] audioController] setMasterOutputVolume:pow(10.0, slider.value / 20.0)];
    [self.outputVolLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
}

@end
