//
//  WTPhotosDataBaseModel.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WTDronePhotoInfoModel.h"

@interface WTPhotosDataBaseModel : NSObject

@property (nonatomic, copy) NSString *singleKey;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *device;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) WTMediaType mediaType;
@property (nonatomic, copy) NSString *mermory;

+ (id)photoDataBaseModelWithSingleKey:(NSString *)singleKey
                           createDate:(NSString *)createDate
                               author:(NSString *)author
                             location:(NSString *)location
                               device:(NSString *)device
                              mermory:(NSString *)mermory
                                width:(int)width
                               height:(int)height
                                 type:(WTMediaType)type;

@end
