//
//  UIColor+WTColor.m
//  MQX
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "UIColor+WTColor.h"

#import "WTMacros.h"

@implementation UIColor (WTColor)
/*--------------------------- Add by GavinYu Start ----------------------------*/
//MARK: -- Light red color红色
+ (UIColor *)lightRedColor {
  return UICOLOR_FROM_HEXRGB(0xff0030);
}

//MARK: -- grayish color浅灰色
+ (UIColor *)grayishColor {
  return UICOLOR_FROM_HEXRGB(0x888888);
}

//MARK: -- middleGray中黑色
+ (UIColor *)middleGrayColor {
  return UICOLOR_FROM_HEXRGB(0xbbbbbb);
}

//MARK: -- light grayish color淡灰色
+ (UIColor *)lightGrayishColor {
  return UICOLOR_FROM_HEXRGB(0xdddddd);
}

//MARK: -- atrous 深黑色
+ (UIColor *)atrousColor {
  return UICOLOR_FROM_HEXRGB(0x1e1e1e);
}

//MARK: -- Blue蓝色
+ (UIColor *)wtBlueColor {
  return UICOLOR_FROM_HEXRGB(0x226bbb);
}

//MARK: -- Green绿色
+ (UIColor *)wtGreenColor {
  return UICOLOR_FROM_HEXRGB(0x00c666);
}

//MARK: -- glaucous（蓝绿色）
+ (UIColor *)glaucousColor{
  return UICOLOR_FROM_HEXRGB(0x11aabb);
}

//视图背景色
+ (UIColor *)wtViewBackgroundColor {
  return UICOLOR_FROM_HEXRGB(0xf8f8f8);
}

//MARK: -- 火鸟的浅绿色
+ (UIColor *)wtFirebirdLightGreenColor {
  return UICOLOR_FROM_HEXRGB(0x99eebb);
}

//MARK: -- 火鸟的深绿色
+ (UIColor *)wtFirebirdDarkGreenColor {
  return UICOLOR_FROM_HEXRGB(0x119555);
}

//MARK: -- 火鸟的黄色
+ (UIColor *)wtFirebirdYellowColor {
  return UICOLOR_FROM_HEXRGB(0xffb81e);
}

//MARK: -- 火鸟的绿色
+ (UIColor *)wtFirebirdGreenColor {
  return UICOLOR_FROM_HEXRGB(0x00dd77);
}

//MARK: -- 火鸟的纯白色
+ (UIColor *)wtFirebirdWhiteColor {
  return [UIColor whiteColor];
}
/*--------------------------- Add by GavinYu End ----------------------------*/
@end
