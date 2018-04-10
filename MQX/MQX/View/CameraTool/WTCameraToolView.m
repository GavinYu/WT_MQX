//
//  WTCameraToolView.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTCameraToolView.h"

#import "WTAppConfig.h"
#import "WTSDCardInfoModel.h"

@interface WTCameraToolView ()

@property (weak, nonatomic) IBOutlet UIButton *cameraSettingButton;
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;

@end

@implementation WTCameraToolView
- (void)dealloc {
  DLog(@"dealloc: %@", NSStringFromClass([self class]));
}
//MARK: -- setter cameraMode
- (void)setCameraMode:(WTCameraMode)cameraMode {
  _cameraMode = cameraMode;
  if (cameraMode == WTCameraModeVideo) {
    [UIButton setButtonImageForState:_switchModeButton withImageName:@"switch_photoMode"];
    [UIButton setButtonImageForState:_cameraOperateButton withImageName:@"video"];
  } else if (cameraMode == WTCameraModeTakePhoto) {
    [UIButton setButtonImageForState:_switchModeButton withImageName:@"switch_videoMode"];
    [UIButton setButtonImageForState:_cameraOperateButton withImageName:@"takePhoto"];
  }
}

+ (WTCameraToolView *)instanceCameraToolView {
  NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"WTCameraToolView" owner:nil options:nil];
  return [nibView objectAtIndex:0];
}

- (void)initSubView:(BOOL)connected {
  self.cameraMode = WTCameraModeVideo;
  
  _switchModeButton.tag = WTEventActionCameraSwitchMode;
  _cameraOperateButton.tag = WTEventActionCameraOperate;
  _cameraSettingButton.tag = WTEventActionCameraSetting;
  _galleryButton.tag = WTEventActionCameraGallery;
  
  [self updateBtnImageWithConnect:connected];
  
  [[WTABECamManager sharedABECamManager] getSDCardInfo:^(WTSDCardInfoModel *SDCardInfo) {
    if (SDCardInfo.errorcode == 0) {
      DLog(@"获取SD卡信息成功");
    }
  }];
}
//MARK: -- 根据连接状态更新相机工具栏
- (void)updateBtnImageWithConnect:(BOOL)connect
{
  self.switchModeButton.enabled = connect;
  self.cameraOperateButton.enabled = connect;
  self.galleryButton.enabled = connect;
  
  [UIButton setButtonImageForState:self.galleryButton withImageName:@"drone_gallery"];
  if (self.cameraMode == WTCameraModeVideo) {
    [UIButton setButtonImageForState:_switchModeButton withImageName:@"switch_photoMode"];
    [UIButton setButtonImageForState:_cameraOperateButton withImageName:@"video"];
  } else if (self.cameraMode == WTCameraModeTakePhoto) {
    [UIButton setButtonImageForState:_switchModeButton withImageName:@"switch_videoMode"];
    [UIButton setButtonImageForState:_cameraOperateButton withImageName:@"takePhoto"];
  }
}
//MARK: --
- (IBAction)clickCameraSwitchModeButton:(UIButton *)sender {
  [sender setSelected:!sender.isSelected];
  
  if (_cameraToolViewEventBlock) {
    _cameraToolViewEventBlock(sender);
  }
}
//MARK: --
- (IBAction)clickCameraOperateButton:(UIButton *)sender {
  if (self.cameraMode == WTCameraModeVideo) {
    [sender setSelected:!sender.isSelected];
    _switchModeButton.enabled = !sender.isSelected;
  }
  
  if (_cameraToolViewEventBlock) {
    _cameraToolViewEventBlock(sender);
  }
}
//MARK: --
- (IBAction)clickCameraSettingButton:(UIButton *)sender {
  if (_cameraToolViewEventBlock) {
    _cameraToolViewEventBlock(sender);
  }
}
//MARK: --
- (IBAction)clickGalleryButton:(UIButton *)sender {
  if (_cameraToolViewEventBlock) {
    _cameraToolViewEventBlock(sender);
  }
}

//MARK: -- SET IsShowVideoTime
- (void)setIsShowVideoTime:(BOOL)isShowVideoTime {
  _cameraOperateButton.hidden = isShowVideoTime;
  _switchModeButton.hidden = isShowVideoTime;
  _cameraSettingButton.hidden = isShowVideoTime;
  _galleryButton.hidden = isShowVideoTime;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
