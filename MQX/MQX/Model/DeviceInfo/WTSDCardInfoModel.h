//
//  WTSDCardInfoModel.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTSDCardInfoModel : NSObject
@property (assign, nonatomic) NSInteger errorcode;
@property (assign, nonatomic) NSInteger sdspace;
@property (copy, nonatomic) NSString *sdspace_decimals;
@property (assign, nonatomic) NSInteger totalspace;
@property (copy, nonatomic) NSString *totalspace_decimals;
@property (copy, nonatomic) NSString *type;
@end
