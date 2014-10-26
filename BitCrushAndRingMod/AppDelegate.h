//
//  AppDelegate.h
//  BitCrushAndRingMod
//
//  Created by Brian Wang on 10/25/14.
//  Copyright (c) 2014 BW Innovation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AEAudioController;
@class AEBlockFilter;
@class AEPlaythroughChannel;
@class ABAudiobusController;
@class ABFilterPort;
@class ABReceiverPort;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AEAudioController *audioController;
@property (strong, nonatomic) AEPlaythroughChannel *channel;
@property (strong, nonatomic) AEBlockFilter *filter;
@property (strong, nonatomic) ABAudiobusController *audiobusController;
@property (strong, nonatomic) ABFilterPort *filterPort;
@property (strong, nonatomic) ABReceiverPort *receiverPort;
@property (assign, nonatomic) float bcResolution;
@property (assign, nonatomic) float bcBitDepth;
@property (assign, nonatomic) float rmFrequency;
@property (assign, nonatomic) int rmWaveType;

+ (id)sharedInstance;

@end

