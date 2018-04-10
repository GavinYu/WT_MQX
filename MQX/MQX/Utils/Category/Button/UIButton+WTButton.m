//
//  UIButton+WTButton.m
//  MQX
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "UIButton+WTButton.h"

@implementation UIButton (WTButton)
/*--------------------------- Add by GavinYu Start ----------------------------*/
//MARK: -- 设置带有文字和图片的按钮
+ (void)setButtonTitleAndImage:(UIButton *)sender {
  sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
  [sender setTitleEdgeInsets:UIEdgeInsetsMake(sender.imageView.frame.size.height, -sender.imageView.frame.size.width, 0, 0)];
  [sender setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -sender.titleLabel.bounds.size.width)];
}

//MARK: -- 设置按钮圆角
+ (void)setButtonFillet:(UIButton *)sender withCornerRadius:(CGFloat)cornerRadius withBorderWidth:(CGFloat)borderWidth withBorderColor:(nullable UIColor *)borderColor {
  sender.layer.cornerRadius = cornerRadius;
  sender.layer.masksToBounds = YES;
  sender.layer.borderWidth = borderWidth;
  if (borderColor) {
    sender.layer.borderColor = borderColor.CGColor;
  }
}

//MARK: -- 设置按钮阴影效果
+ (void)setButtonShadow:(UIButton *)sender withShadowOffset:(CGSize)shadowOffset withShadowOpacity:(CGFloat)shadowOpacity withShadowColor:(UIColor *)shadowColor {
  sender.layer.shadowOffset = shadowOffset;
  sender.layer.shadowOpacity = shadowOpacity;
  sender.layer.shadowColor = shadowColor.CGColor;
  sender.layer.shadowRadius = shadowOffset.width;
}

//MARK: -- 设置按钮图片在normal和selected状态下
+ (void)setButtonImageForState:(UIButton *)sender withImageName:(NSString *)name {
  NSString *text = sender.titleLabel.text;
  NSString *currentText = [text componentsSeparatedByString:@"_"][1];
  NSLog(@"----%@", currentText);
  if ([currentText isEqualToString:name]) {
    return;
  }
  if (sender.enabled) {
    [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_%@_normal", name]] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_%@_selected", name]] forState:UIControlStateSelected];
    [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_%@_highlight", name]] forState:UIControlStateHighlighted];
  } else {
    [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_%@_disable", name]] forState:UIControlStateNormal];
  }
}

@end
