//
//  WTCameraCommonSettingView.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WTEnum.h"
#import "WTCameraSettingView.h"

@protocol WTCameraCommonSettingViewDelegate <NSObject>

@optional
- (void)cameraSettingView_didSelectedIndexPath:(NSIndexPath *)indexPath;
- (void)back;
- (void)footerView_resetCameraSettings;
- (void)footerView_formatSDcardStoreage;

@end

@interface WTCameraCommonSettingView : UIView
@property (nonatomic, assign) WTCameraSettingViewType cameraSettingViewType;
@property (nonatomic, weak) id<WTCameraCommonSettingViewDelegate> delegate;
@property (nonatomic, assign) BOOL showBackBtn;
// 配置完视图之后在设置数据
@property (nonatomic, copy) NSMutableDictionary *dataDictionary;
@property (nonatomic, strong) NSIndexPath *previousIndexPath;
@property (nonatomic, strong) NSIndexPath *originIndexPath;

- (void)updateFooterViewStorage;
- (void)reloadCellWithIndexPaths:(NSArray *)indexPaths;
- (void)reloadTableView;
@end
