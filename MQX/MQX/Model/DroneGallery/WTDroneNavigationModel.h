//
//  WTDroneNavigationModel.h
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTDroneNavigationModel : NSObject
@property (nonatomic, assign) NSInteger videosAmount;
@property (nonatomic, assign) NSInteger photosAmount;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, assign) NSUInteger totalMediasAmount;
@end
