//
//  WTCircleProgressModel.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCircleProgressModel : NSObject
@property (nonatomic, assign) NSInteger currentDownloadNum;
@property (nonatomic, assign) NSInteger totalDownloadNum;
@property (nonatomic, copy) NSString *fileSize;
@end
