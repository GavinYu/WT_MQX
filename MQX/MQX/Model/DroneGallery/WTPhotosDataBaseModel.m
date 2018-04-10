//
//  WTPhotosDataBaseModel.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTPhotosDataBaseModel.h"

@implementation WTPhotosDataBaseModel
- (id)initWithSingleKey:(NSString *)singleKey
             createDate:(NSString *)createDate
                 author:(NSString *)author
               location:(NSString *)location
                 device:(NSString *)device
                mermory:(NSString *)mermory
                  width:(int)width
                 height:(int)height
                   type:(WTMediaType)type
{
  if (self = [super init]) {
    self.singleKey = singleKey;
    self.createDate = createDate;
    self.author = author;
    self.location = location;
    self.device = device;
    self.mermory = mermory;
    self.width = width;
    self.height = height;
    self.mediaType = type;
  }
  return self;
}

+ (id)photoDataBaseModelWithSingleKey:(NSString *)singleKey
                           createDate:(NSString *)createDate
                               author:(NSString *)author
                             location:(NSString *)location
                               device:(NSString *)device
                              mermory:(NSString *)mermory
                                width:(int)width
                               height:(int)height
                                 type:(WTMediaType)type
{
  return [[WTPhotosDataBaseModel alloc] initWithSingleKey:singleKey createDate:createDate author:author location:location device:device mermory:mermory width:width height:height type:type];
}
@end
