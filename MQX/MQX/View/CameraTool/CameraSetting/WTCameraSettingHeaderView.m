//
//  WTCameraSettingHeaderView.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTCameraSettingHeaderView.h"

@implementation WTCameraSettingHeaderView
+ (instancetype)cameraSetttingHeaderView
{
  return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
