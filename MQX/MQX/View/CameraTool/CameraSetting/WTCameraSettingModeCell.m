//
//  WTCameraSettingModeCell.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTCameraSettingModeCell.h"

#import "WTCameraSettingModel.h"
#import "WTAppConfig.h"

@interface WTCameraSettingModeCell ()
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrowImageView;
@end

@implementation WTCameraSettingModeCell

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
  _itemLabel.font = [UIFont thirteenFontSize];
  _statusLabel.font = [UIFont tenFontSize];
}

//MARK: -- config Cell
- (void)configureWithModel:(WTCameraSettingModel *)model
{
  _itemLabel.text = NSLocalizedString(model.item, nil);
  //    CGFloat width = [WTUtil getTextWidthWithContent:_itemLabel.text withContentSizeOfHeight:CGRectGetHeight(_itemLabel.bounds) withAttribute:@{NSFontAttributeName:_itemLabel.font}];
  //    [_itemLabel mas_updateConstraints:^(MASConstraintMaker *make) {
  //        make.width.equalTo(@(width));
  //    }];
  //    [self layoutIfNeeded];
  
  _statusLabel.text = NSLocalizedString(model.status, nil);
  _statusLabel.hidden = model.status.length > 0 ? NO:YES;
}
//MARK: -- setter titleColor
- (void)setTitleColor:(UIColor *)titleColor {
  _titleColor = titleColor;
  _itemLabel.textColor = _titleColor;
}

//MARK: -- setter isShowRightArrowImage
- (void)setIsShowRightArrowImage:(BOOL)isShowRightArrowImage {
  _isShowRightArrowImage = isShowRightArrowImage;
  _rightArrowImageView.hidden = !_isShowRightArrowImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
