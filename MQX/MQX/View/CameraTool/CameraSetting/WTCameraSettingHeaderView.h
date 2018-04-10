//
//  WTCameraSettingHeaderView.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCameraSettingHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
+ (instancetype)cameraSetttingHeaderView;
@end
