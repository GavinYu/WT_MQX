//
//  UIButton+WTButton.h
//  MQX
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WTButton)

/*--------------------------- Add by GavinYu Start ----------------------------*/
//设置带有文字和图片的按钮
+ (void)setButtonTitleAndImage:(UIButton *)sender;
//设置按钮圆角
+ (void)setButtonFillet:(UIButton *)sender withCornerRadius:(CGFloat)cornerRadius withBorderWidth:(CGFloat)borderWidth withBorderColor:(nullable UIColor *)borderColor;
//设置按钮阴影效果
+ (void)setButtonShadow:(UIButton *)sender withShadowOffset:(CGSize)shadowOffset withShadowOpacity:(CGFloat)shadowOpacity withShadowColor:(UIColor *)shadowColor;
//设置按钮图片在normal和selected状态下
+ (void)setButtonImageForState:(UIButton *)sender withImageName:(NSString *)name;
/*--------------------------- Add by GavinYu End ----------------------------*/

@end
