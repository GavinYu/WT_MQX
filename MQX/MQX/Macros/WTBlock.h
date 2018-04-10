//
//  WTBlock.h
//  MQX
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 WT. All rights reserved.
//
#import <CoreGraphics/CoreGraphics.h>

@class UIView;

#ifndef WTBlock_h
#define WTBlock_h

NS_ASSUME_NONNULL_BEGIN

typedef void(^WTEventBlock)(WTEventAction eventAction);
typedef void(^WTBackSendValueBlock)(id _Nullable sendData);
typedef void(^WTUpdateSubViewBlock)(UIView *subView);
typedef void(^WTStartHeadingCompletion)(CGFloat angle);
typedef void(^WTErrorBlock)(NSError *_Nullable error);
typedef void(^WTABECamCompletion)(id _Nullable object);

NS_ASSUME_NONNULL_END
#endif /* WTBlock_h */
