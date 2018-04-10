//
//  WTCameraSettingView.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTCameraSettingView.h"

#import "WTCameraCommonSettingView.h"
#import "WTPopWindowView.h"
#import "WTAppConfig.h"
#import "WTWarningConstMacro.h"
#import "WTAboutInfoView.h"

#define kAnimationTime 0.3
#define kViewWidth 270.0
// 向右动画出window的rect
#define kRightRect CGRectMake(_cameraSettingView.frame.size.width, 0, _cameraSettingView.frame.size.width, _cameraSettingView.frame.size.height - 45)

@interface WTCameraSettingView ()<WTCameraCommonSettingViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *dataDictionary;
@property (nonatomic, strong) WTCameraCommonSettingView *cameraSettingView; // 相机设置主页
@property (nonatomic, strong) WTCameraCommonSettingView *aboutView; // 关于页面
@property (nonatomic, assign) WTCameraSettingViewType type;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSIndexPath *previousIndexPath;

@end


@implementation WTCameraSettingView
//MARK: -- lazyload dataDictionary
- (NSMutableDictionary *)dataDictionary
{
  if (!_dataDictionary) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CameraSetting" ofType:@"plist"];
    _dataDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
  }
  return _dataDictionary;
}

- (void)createUI
{
  self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.frame.size.width - kViewWidth-10, 16, kViewWidth, self.frame.size.height - 32)];
  _scrollView.contentSize = CGSizeMake(kViewWidth * 2, self.frame.size.height - 32);
  _scrollView.scrollEnabled = NO;
  _scrollView.showsVerticalScrollIndicator = NO;
  _scrollView.showsHorizontalScrollIndicator = NO;
  _scrollView.alpha = 0.9;
  [self addSubview:_scrollView];
  
  self.cameraSettingView = [[WTCameraCommonSettingView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, _scrollView.frame.size.height)];
  [_scrollView addSubview:_cameraSettingView];
  _cameraSettingView.delegate = self;
  _cameraSettingView.cameraSettingViewType = WTCameraSettingViewTypeCameraSetting;
  _cameraSettingView.showBackBtn = NO;
  _cameraSettingView.dataDictionary = self.dataDictionary;
  _cameraSettingView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
  self.type = WTCameraSettingViewTypeCameraSetting;
}

#pragma mark - WTCameraCommonSettingViewDelegate
- (void)cameraSettingView_didSelectedIndexPath:(NSIndexPath *)indexPath
{
  NSInteger row = indexPath.row;
  switch (row) {
    case 1:
    {
      [self resetCameraSettings];
    }
      break;
      
    case 2:
    {
      [self formatSDcardStoreage];
    }
      break;
      
    case 3:
    {
      [self pushAboutView];
    }
      break;
      
      
      
    default:
      break;
  }
}

// MARK:推出动画
- (void)pushView
{
  [UIView animateWithDuration:0.2 animations:^{
    _scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
  }];
}

- (void)popView:(UIView *)view
{
  __block UIView *newView = view;
  [UIView animateWithDuration:0.2 animations:^{
    _scrollView.contentOffset = CGPointMake(0, 0);
  } completion:^(BOOL finished) {
    self.type = WTCameraSettingViewTypeCameraSetting;
    [newView removeFromSuperview];
    newView = nil;
  }];
}

// MARK:消失动画
- (void)back
{
  if (self.type == WTCameraSettingViewTypeAbout) {
    [self popView:_aboutView];
  }
}
//MARK: -- 设置视频方向

#pragma mark - 恢复默认设置
- (void)resetCameraSettings
{
  WS(weakSelf);
  
  [WTPopWindowView showMessage:NSLocalizedString(@"camera_setting_reset_tip", nil)
             buttonTitleConfirm:NSLocalizedString(@"person_center_sure", nil)
              buttonTitleCancel:NSLocalizedString(@"person_center_cancel", nil)
                      colorType:PopWindowViewColorTypeOrange
                       sizeType:PopWindowViewSizeTypeBig
                  handleConfirm:^{
                    [[AbeCamHandle sharedInstance] deviceResetToDefault:^(BOOL succeeded) {
                      if (!succeeded) {
                        [weakSelf postNotificationWithNumber:WTWARNING_RESET_ALL_SETTINGS_FAILED];
                      } else {
                        double delayInSeconds = 1.5f;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
                        dispatch_after(popTime, dispatch_get_main_queue(), ^{
                          [weakSelf.cameraSettingView reloadTableView];
                        });
                      }
                    }];
                  }handleCancel:^{
                    
                  }];
}

#pragma mark - 格式化内存卡
- (void)formatSDcardStoreage
{
  WS(weakSelf);
  [WTPopWindowView showMessage:NSLocalizedString(@"camera_setting_do_you_want_to_format_sd_card", nil)
             buttonTitleConfirm:NSLocalizedString(@"person_center_sure", nil)
              buttonTitleCancel:NSLocalizedString(@"person_center_cancel", nil)
                      colorType:PopWindowViewColorTypeOrange
                       sizeType:PopWindowViewSizeTypeSmall
                  handleConfirm:^{
                    [[AbeCamHandle sharedInstance] setSDFormat:^(BOOL succeeded, NSData *data) {
                      if (succeeded) {
                        NSDictionary *tmp = [NSDictionary modelDictionaryWithClass:[NSData class] json:data];
                        DLog(@"成功返回数据：%@", tmp);
                        [weakSelf.cameraSettingView updateFooterViewStorage];
                      }
                      [weakSelf postNotificationWithNumber:succeeded==YES?WTWARNING_CAMERA_SD_FORMAT_SUCCEED:WTWARNING_CAMERA_SD_FORMAT_FAILED];
                    }];
                  } handleCancel:^{
                    
                  }];
}

//MARK: -- PUSH About View
- (void)pushAboutView {
  CGFloat width = self.scrollView.frame.size.width;
  self.aboutView = [[WTCameraCommonSettingView alloc] initWithFrame:CGRectMake(width, 0, kViewWidth, _scrollView.frame.size.height)];
  _aboutView.delegate = self;
  [_scrollView addSubview:_aboutView];
  _aboutView.showBackBtn = YES;
  _aboutView.cameraSettingViewType = WTCameraSettingViewTypeAbout;
  self.type = WTCameraSettingViewTypeAbout;
  NSString *path = [[NSBundle mainBundle] pathForResource:@"About" ofType:@"plist"];
  _aboutView.dataDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
  [self pushView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = touches.anyObject;
  CGPoint point = [touch locationInView:self];
  if (!CGRectContainsPoint(self.scrollView.frame, point)&&[_delegate respondsToSelector:@selector(popView)]) {
    [_delegate popView];
  } else {
    
  }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
  WS(weakSelf);
  if ([keyPath isEqualToString:@"cameraManager.freeStorage"]) {
    if ([change.allKeys containsObject:@"new"] && [change.allKeys containsObject:@"old"]) {
      if (change[@"new"] != NULL && change[@"old"] != NULL) {
        if (![change[@"new"] isEqualToString:change[@"old"]]) {
          dispatch_asWT(dispatch_get_main_queue(), ^{
            [weakSelf.cameraSettingView updateFooterViewStorage];
          });
        }
      }
    }
  }
}

- (void)postNotificationWithNumber:(int)number
{
  [[NSNotificationCenter defaultCenter] postNotificationName:WT_CAMEAR_WARNING_NOTIFICATION object:nil userInfo:@{@"msgid":[NSNumber numberWithInt:number], @"isHidden":[NSNumber numberWithBool:NO]}];
}

- (void)dealloc
{
  //    [self removeObserver:self forKeyPath:@"cameraManager.freeStorage"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
