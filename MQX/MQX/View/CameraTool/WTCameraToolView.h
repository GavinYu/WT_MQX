//
//  WTCameraToolView.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WTCameraMode) {
  WTCameraModeVideo = 0,
  WTCameraModeTakePhoto
};

typedef void(^WTCameraEventBlock)(UIButton *sender);

@interface WTCameraToolView : UIView

@property (copy, nonatomic) WTCameraEventBlock cameraToolViewEventBlock;
@property (weak, nonatomic) IBOutlet UIButton *switchModeButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraOperateButton;
@property (nonatomic, assign) WTCameraMode cameraMode;

//录像只显示录像时间
@property (assign, nonatomic) BOOL isShowVideoTime;

+ (WTCameraToolView *)instanceCameraToolView;
- (void)initSubView:(BOOL)connected;
- (void)updateBtnImageWithConnect:(BOOL)connect;
- (IBAction)clickCameraSwitchModeButton:(UIButton *)sender;
- (IBAction)clickCameraOperateButton:(UIButton *)sender;
- (IBAction)clickCameraSettingButton:(UIButton *)sender;
- (IBAction)clickGalleryButton:(UIButton *)sender;

@end
