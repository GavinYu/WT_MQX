//
//  WTAVPlayerView.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import "YNCEnum.h"

@protocol AVPlayerViewDelegate <NSObject>

@optional
- (void)touchPlayerView;
- (void)playOrPause;
- (void)playComplete;
- (void)fullScreen;
- (void)backBtnAction;

@end

@interface WTAVPlayerView : UIView
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, weak) id<AVPlayerViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *fullScreenBtn;
@property (nonatomic, assign) YNCPlayerMode playerMode;
- (void)play;
- (void)pause;
+ (instancetype)sharedFB_AVPlayerView;
- (void)setUpSubviews;
- (void)removeTimerObserver;
- (void)layoutProgressLine;
@end
