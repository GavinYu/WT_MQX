//
//  UIFont+WTFont.h
//  MQX
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (WTFont)
/*-------------- Bold Font start --------------*/

//ten Size Bold
+ (UIFont *)tenBoldFontSize;
//sixteen Size Bold
+ (UIFont *)sixteenBoldFontSize;
//eighteen Size Bold
+ (UIFont *)eighteenBoldFontSize;
//twentyOne Size Bold
+ (UIFont *)twentyOneBoldFontSize;

/*-------------- Bold Font end ----------------*/

/*-------------- normal Font start --------------*/
//ten Size
+ (UIFont *)tenFontSize;
//twelve Size
+ (UIFont *)twelveFontSize;
//thirteen Size
+ (UIFont *)thirteenFontSize;
//MARK: -- fourteen Size
+ (UIFont *)fourteenFontSize;
//sixteen Size
+ (UIFont *)sixteenFontSize;
//eighteen Size
+ (UIFont *)eighteenFontSize;

/*-------------- normal Font end --------------*/
@end

NS_ASSUME_NONNULL_END
