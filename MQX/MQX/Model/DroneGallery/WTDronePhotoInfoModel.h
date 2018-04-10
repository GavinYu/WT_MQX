//
//  WTDronePhotoInfoModel.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger, WTMediaType)
{
  WTMediaTypeSystemPhoto = 1,
  WTMediaTypeSystemVideo,
  WTMediaTypeDronePhoto,
  WTMediaTypeDroneVideo,
  WTMediaTypeEditedPhoto,
  WTMediaTypeEditedVideo
};

@interface WTDronePhotoInfoModel : NSObject
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tubImageDataSize;
@property (nonatomic, copy) NSString *originImageDataSize;
@property (nonatomic, copy) NSString *tubVideoDataSize;
@property (nonatomic, copy) NSString *originVideoDataSize;
@property (nonatomic, assign) CGFloat pixelWidth;
@property (nonatomic, assign) CGFloat pixelHeight;

@property (nonatomic, assign) WTMediaType mediaType;
@end
