//
//  WTCameraSettingModeCell.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTCameraSettingModel;

@interface WTCameraSettingModeCell : UITableViewCell
@property (strong, nonatomic) UIColor *titleColor;
@property (assign, nonatomic) BOOL isShowRightArrowImage;

- (void)configureWithModel:(WTCameraSettingModel *)model;
@end
