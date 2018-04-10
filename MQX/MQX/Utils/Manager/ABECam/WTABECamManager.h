//
//  WTABECamManager.h
//  MQX
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Singleton.h"
#import "WTBlock.h"

@class WTDeviceInfoModel;
@class WTSDCardInfoModel;

@interface WTABECamManager : NSObject
SingletonH(ABECamManager)
/*
 * The connection status of the component.
 */
@property (nonatomic, readonly) BOOL  WiFiConnected;
//SD卡总容量
@property (nonatomic, readonly) NSString *totalStorage;
//SD卡可用容量
@property (nonatomic, readonly) NSString *freeStorage;
//设备信息
@property (nonatomic, readonly) WTDeviceInfoModel *deviceInfo;

//监测WiFi连接的状态
- (void)checkWiFiState;
//释放监测WiFi连接的状态的定时器
- (void)freeCheckWiFiTimer;
//获取SD卡信息
- (void)getSDCardInfo:(void(^)(WTSDCardInfoModel *SDCardInfo))block;
@end
