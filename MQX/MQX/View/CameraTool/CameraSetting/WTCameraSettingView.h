//
//  WTCameraSettingView.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTCameraSettingViewDelegate <NSObject>
- (void)popView;
@end

@interface WTCameraSettingView : UIView
@property (nonatomic, weak) id<WTCameraSettingViewDelegate> delegate;
- (void)createUI;
@end
