//
//  WTCameraCommonSettingView.m
//  MQX
//
//  Created by admin on 2018/3/22.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTCameraCommonSettingView.h"

#import "WTCameraSettingModeCell.h"
#import "WTCameraSettingModel.h"
#import "WTCameraSettingHeaderView.h"

#import "WTSwitchCell.h"
#import "WTAppConfig.h"
#import "WTWarningConstMacro.h"
#import "WTAboutInfoCell.h"
#import "WTDeviceInfoModel.h"

#define kCell @"commonSettingViewcell"
#define kTableViewCell @"commonSettingTableViewCell"

static NSString *SWITCHCELL = @"switchcell";
static NSString *ABOUTCELL = @"aboutcell";

@interface WTCameraCommonSettingView ()<UITableViewDelegate, UITableViewDataSource, WTSwitchCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) WTCameraSettingHeaderView *headerView;
@property (nonatomic, assign) BOOL SW_On; // 记录switch状态
@property (nonatomic, strong) NSMutableArray *currentStatusArray;

@property (nonatomic, strong) UILabel *aboutCopyrightLabel;

@end
@implementation WTCameraCommonSettingView
//MARK: -- lazyload aboutCopyrightLabel
- (UILabel *)aboutCopyrightLabel {
  if (!_aboutCopyrightLabel) {
    _aboutCopyrightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 50)];
    _aboutCopyrightLabel.text = @"Copyright © 2018 YUNEEC All Rights Reserved";
    _aboutCopyrightLabel.font = [UIFont twelveFontSize];
    _aboutCopyrightLabel.textColor = [UIColor grayishColor];
    _aboutCopyrightLabel.backgroundColor = [UIColor whiteColor];
    _aboutCopyrightLabel.textAlignment = NSTextAlignmentCenter;
  }
  
  return _aboutCopyrightLabel;
}
#pragma mark - setter
- (void)setDataDictionary:(NSMutableDictionary *)dataDictionary
{
  _dataDictionary = dataDictionary;
  self.dataArray = dataDictionary[@"content"];
  _headerView.titleLabel.text = NSLocalizedString(self.dataDictionary[@"title"], nil);
  
  [self.tableView reloadData];
}

- (void)setShowBackBtn:(BOOL)showBackBtn
{
  _showBackBtn = showBackBtn;
  self.headerView.backBtn.hidden = !showBackBtn;
  if (showBackBtn) {
    [self.headerView.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
  }
}

- (void)setOriginIndexPath:(NSIndexPath *)originIndexPath
{
  if (_originIndexPath != originIndexPath) {
    _originIndexPath = originIndexPath;
  }
}

- (NSMutableArray *)currentStatusArray
{
  if (!_currentStatusArray) {
    _currentStatusArray = [NSMutableArray arrayWithCapacity:0];
  }
  return _currentStatusArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self createUI];
  }
  return self;
}

- (void)createUI
{
  _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.showsVerticalScrollIndicator = NO;
  self.headerView = [WTCameraSettingHeaderView cameraSetttingHeaderView];
  _headerView.backgroundColor = [UIColor WTViewBackgroundColor];
  _headerView.frame = CGRectMake(0, 0, self.frame.size.width, 45);
  _headerView.titleLabel.textColor = [UIColor WTGreenColor];
  _headerView.titleLabel.font = [UIFont fourteenFontSize];
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _tableView.backgroundColor = [UIColor WTViewBackgroundColor];
  [self addSubview:_tableView];
  
  [_tableView registerNib:[UINib nibWithNibName:@"WTCameraSettingModeCell" bundle:nil] forCellReuseIdentifier:kCell];
  [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WTFB_SwitchCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:SWITCHCELL];
  [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WTAboutInfoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ABOUTCELL];
  [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
}
//MARK: -- UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return _headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  if (self.cameraSettingViewType == WTCameraSettingViewTypeAbout) {
    return self.aboutCopyrightLabel;
  } else {
    return nil;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger row = indexPath.row;
  
  NSDictionary *rowDic;
  WTCameraSettingModel *rowDataModel;
  if (self.dataArray.count > 0) {
    rowDic = self.dataArray[row];
    rowDataModel = [WTCameraSettingModel new];
    //将字典转换成数据模型
    [rowDataModel setValuesForKeysWithDictionary:rowDic];
  }
  
  switch (self.cameraSettingViewType) {
    case WTCameraSettingViewTypeCameraSetting:
    {
      if (row == 0) {
        WTFB_SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:SWITCHCELL];
        cell.leftConstraint.constant = 10;
        cell.rightConstraint.constant = 10;
        _SW_On = NO;
        cell.showLine = NO;
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.switchBtn.on = _SW_On;
        [cell configureTextLabel:rowDataModel];
        
        return cell;
        
      } else {
        WTCameraSettingModeCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (row == 1 || row == 2) {
          cell.titleColor = [UIColor lightRedColor];
        }
        
        if (row == 2) {
          cell.isShowRightArrowImage = NO;
        }
        
        [cell configureWithModel:rowDataModel];
        
        return cell;
      }
      
    }
      break;
      
    case WTCameraSettingViewTypeAbout:
    {
      WTAboutInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ABOUTCELL];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      switch (row) {
        case 0:
          break;
          
        case 1:
          rowDataModel.status = [WTABECamManager sharedABECamManager].deviceInfo.fwversion;
          break;
          
        case 2:
          rowDataModel.status = APPVERSION;
          break;
          
        default:
          break;
      }
      
      [cell configureWithModel:rowDataModel];
      
      return cell;
    }
      break;
      
    default:
      return nil;
      break;
  }
}

//MARK: -- UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  return self.cameraSettingViewType == WTCameraSettingViewTypeAbout ? 50 : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 42;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (self.cameraSettingViewType) {
    case WTCameraSettingViewTypeCameraSetting:
      if ([_delegate respondsToSelector:@selector(cameraSettingView_didSelectedIndexPath:)]) {
        [_delegate cameraSettingView_didSelectedIndexPath:indexPath];
      }
      break;
    default:
      break;
      
  }
}
//MARK: -- 创建UITabelViewCell
- (UITableViewCell *)createTableViewCellWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCell];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  NSString *imageName;
  NSString *title;
  if (indexPath.row > self.dataArray.count - 1) {
    NSMutableDictionary *dic = self.dataArray[indexPath.row - 1];
    imageName = dic[@"imageName"];
    title = NSLocalizedString(dic[@"title"], nil);
  } else {
    NSMutableDictionary *dic = self.dataArray[indexPath.row];
    imageName = dic[@"imageName"];
    title = NSLocalizedString(dic[@"title"], nil);
  }
  imageName = [imageName stringByAppendingString:@"Normal"];
  cell.imageView.image = [UIImage imageNamed:imageName];
  cell.textLabel.text = title;
  cell.textLabel.font = [UIFont thirteenFontSize];
  cell.textLabel.textColor = [UIColor atrousColor];
  return cell;
}
//MARK: -- 更新SD卡容量
- (void)updateFooterViewStorage
{
  
}

#pragma mark - BtnAction
- (void)backBtnAction:(UIButton *)sender
{
  if ([_delegate respondsToSelector:@selector(back)]) {
    [_delegate back];
  }
}

#pragma mark - WTFB_SwitchCellDelegate
- (void)switchBtnAction:(UISwitch *)btn {
  WS(weakSelf);
  
  [[AbeCamHandle sharedInstance] setFlipWithStatus:[NSNumber numberWithBool:btn.on] result:^(BOOL succeeded) {
    if (!succeeded) {
      [weakSelf postCameraNotificationWithNumber:WTWARNING_CAMERA_VIDEO_DIRECTION_FAILED];
    }
  }];
}
//MARK: -- setter _SW_On
- (void)switchIsOn:(BOOL)isOn
{
  _SW_On = isOn;
}
//MARK: -- reload Cell
- (void)reloadCellWithIndexPaths:(NSArray *)indexPaths
{
  [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationNone)];
}
//MARK: -- reload TableView
- (void)reloadTableView
{
  [self.tableView reloadData];
}
//MARK: -- post CameraNotification
- (void)postCameraNotificationWithNumber:(int)number
{
  [[NSNotificationCenter defaultCenter] postNotificationName:WT_CAMEAR_WARNING_NOTIFICATION object:nil userInfo:@{@"msgid":[NSNumber numberWithInt:number], @"isHidden":[NSNumber numberWithBool:NO]}];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
