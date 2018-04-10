//
//  WTEnum.h
//  MQX
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 WT. All rights reserved.
//

#ifndef WTEnum_h
#define WTEnum_h


/*--------------------------- Add by GavinYu Start ----------------------------*/

//MARK: -- 按钮事件的枚举
typedef NS_ENUM(NSUInteger, WTEventAction) {
  //login and register
  WTEventActionLogin = 101,
  WTEventActionRegister,
  
  //user info
  WTEventActionEditUserInfo,
  
  //NavgationBar button
  WTEventActionNavBarLeftBtn,
  WTEventActionNavBarRightBtn,
  WTEventActionNavBarRightFlightLogSettingBtn,
  
  //横屏导航栏
  WTEventActionNavBarHomeBtn,
  WTEventActionNavBarSettingBtn,
  
  //相机操作工具栏
  WTEventActionCameraSwitchMode,
  WTEventActionCameraOperate,
  WTEventActionCameraSetting,
  WTEventActionCameraGallery,
  
  //图传的火鸟首页按钮事件
  WTEventActionFirebirdHomepageTrims,
  WTEventActionFirebirdHomepageWifiName
};

//MARK: -- 切图的命名的枚举
typedef NS_ENUM(NSUInteger, WTCropType) {
  WTCropTypeButton = 0,
  WTCropTypeButtonAble,
  WTCropTypeIcon,
  WTCropTypeBackground
};

//MARK: -- 飞行模式
typedef NS_ENUM(NSUInteger, WTFlightMode) {
  //驾驶员模式
  WTFlightModePilot = 0,
  //自拍模式
  WTFlightModeSelfie,
  //环绕模式
  WTFlightModeOrbit,
  //路程预设模式
  WTFlightModeJourney,
  //跟随模式
  WTFlightModeFollowMe,
  //FPV模式
  WTFlightModeFPV,
  //体感模式
  WTFlightModeSomatosensory
};

//MARK: -- DrogButton Enum
typedef NS_ENUM(NSUInteger, WTDragButtonType) {
  //起飞按钮
  WTDragButtonTypeTakeOff = 0,
  //降落按钮
  WTDragButtonTypeLand,
  //一键返航按钮
  WTDragButtonTypeGoHome
};

//MARK: -- DrogButtonState Enum
typedef NS_ENUM(NSUInteger, WTDragButtonState) {
  //正常状态
  WTDragButtonStateNormal = 0,
  //高亮状态
  WTDragButtonStateHighlighted,
  //到顶选中松开状态
  WTDragButtonStateSelected,
  //暂停状态
  WTDragButtonStateStop,
  //未知状态
  WTDragButtonStateUnknown
};

//MARK: -- 手柄操作模式 Enum
typedef NS_ENUM(NSUInteger, WTHandleMode) {
  //美国手
  WTHandleModeUSA = 0,
  //日本手
  WTHandleModeJapan,
  //未知状态
  WTHandleModeUnknown
};

//MARK: -- 方位：上下左右前后 Enum
typedef NS_ENUM(NSUInteger, WTDirection) {
  //左
  WTDirectionLeft = 0,
  //右
  WTDirectionRight,
  //前
  WTDirectionFront,
  //后
  WTDirectionBehind,
  //上
  WTDirectionUp,
  //下
  WTDirectionDown,
  //未知
  WTDirectionUnknown
};

//MARK: -- Firebird 的 飞行模式
typedef NS_ENUM(NSUInteger, WTFirebirdFlightMode) {
  //    WTFirebirdFlightMode_Throttle_SOLID = 0, //
  //    WTFirebirdFlightMode_Throttle_FLASHING, //1
  //    WTFirebirdFlightMode_Throttle_WOULD_BE_SOLID_NO_GPS, //2
  //    WTFirebirdFlightMode_Angle_SOLID, //3
  //    WTFirebirdFlightMode_Angle_FLASHING, //4
  //    WTFirebirdFlightMode_Angle_WOULD_BE_SOLID_NO_GPS, //5
  //    WTFirebirdFlightMode_SMART, //6
  //    WTFirebirdFlightMode_SMART_BUT_NO_GPS, //7
  //    WTFirebirdFlightMode_MOTORS_STARTING, //8
  //    WTFirebirdFlightMode_TEMP_CALIB, //9
  //    WTFirebirdFlightMode_PRESS_CALIB, //10
  //    WTFirebirdFlightMode_ACCELBIAS_CALIB, //11
  //    WTFirebirdFlightMode_EMERGENCY_KILLED, //12
  //    WTFirebirdFlightMode_GO_HOME,//13
  //    WTFirebirdFlightMode_LANDING, //14
  //    WTFirebirdFlightMode_BINDING, //15
  //    WTFirebirdFlightMode_READY_TO_START, //16
  //    WTFirebirdFlightMode_WAITING_FOR_RC, //17
  //    WTFirebirdFlightMode_MAG_CALIB, //18
  //    WTFirebirdFlightMode_UNKNOWN,
  //    WTFirebirdFlightMode_Agility, //20
  //    WTFirebirdFlightMode_FOLLOW, //21
  //    WTFirebirdFlightMode_FOLLOW_NO_ST10_GPS, //22
  //    WTFirebirdFlightMode_Watch_Me, //23
  //    WTFirebirdFlightMode_Watch_Me_NO_ST10_GPS, //24
  //    WTFirebirdFlightMode_GUIDE_MODE,//25
  //    WTFirebirdFlightMode_CCC, //26
  //    WTFirebirdFlightMode_Jour, //27
  //    WTFirebirdFlightMode_Orbit, //28
  //    WTFirebirdFlightMode_POI, //29
  //    WTFirebirdFlightMode_3D_FOLLOW_WIZARD, //30
  //    WTFirebirdFlightMode_3D_Watch_Me_WIZARD //31
  FIXWING_BEGINNER=0,        //稳定安全模式
  FIXWING_MEDIUN=1,          //稳定模式
  FIXWING_EXPERIENCER=2,     //三轴模式
  FIX_WING_LOST_SINGAL=3,    //信号丢失
  FIX_WING_LOITER=4,         //回航盘旋
  FIX_WING_GO_HOME=5,        //自动降落
  MAG_CAL=6,                 //地磁校准
  WRONG_TASK=7              //错误提醒
};

//MARK: -- HD Racer 的 飞行模式
typedef NS_ENUM(NSUInteger, WTHDRacerFlightMode) {
  WTHDRacerFlightModeAccelerator = 2,        //油门模式
  WTHDRacerFlightModePressure    = 5,       //气压模式
  WTHDRacerFlightModeUnknown = 0x00ff       //未知模式
};

//MARK: -- 通道类型
typedef NS_ENUM(NSUInteger, WTChannelIndexType) {
  WTChannelIndexTypeLeftUpDown = 0,
  WTChannelIndexTypeRightLeftRight,
  WTChannelIndexTypeRightUpDown,
  WTChannelIndexTypeLeftLeftRight
};

//MARK: -- 警告类型
typedef NS_ENUM(NSInteger, WTWarningLevel) {
  WTWarningLevelFirst = 0,
  WTWarningLevelSecond,
  WTWarningLevelThird,
  WTWarningLevelUnknown = 0x00ff
};

//视频流显示模式：单屏、双屏
typedef NS_ENUM(NSInteger, WTModeDisplay)  {
  WTModeDisplayNormal = 0,
  WTModeDisplayGlass
};

//MARK: -- 飞行状态
typedef NS_ENUM(NSInteger, WTFlyingStatus) {
  ON_GROUND = 0,
  TAKING_OFF,
  IN_AIR,
  TAKE_OFF_FAILED,
  LADING,
  READY,
  IN_MISSION,
  RETURN_TO_HOME,
  UNKNOWN
};

//GPS状态
typedef NS_ENUM(NSInteger, WTGPSStatus) {
  WTGPSStatusClose = 0,
  WTGPSStatusOpen,
  WTGPSStatusEnable,
  WTGPSStatusDisable
};

//GPS状态
typedef NS_ENUM(NSUInteger, WTVehicleType) {
  WTVehicleType_H920 = 1,
  WTVehicleType_Q500,
  WTVehicleType_350QX,
  WTVehicleType_CHROMA,
  WTVehicleType_TYPHOON_H,
  WTVehicleType_H920_PLUS,
  WTVehicleType_520,
  WTVehicleType_HD_RACER,
  WTVehicleType_250QX,
  WTVehicleType_FIREBIRD_FPV
};

/*--------------------------- Add by GavinYu End ----------------------------*/

/*--------------------------- Add by Hank start ----------------------------*/
#pragma mark - 图片编辑相关
//MARK: -- 图片编辑公共模块显示种类 Enum
typedef NS_ENUM(NSInteger, WTImageEditorType) {
  WTImageEditorSorts = 0, // 形状,翻转,滤镜
  WTImageEditorShapeCut, // 形状
  WTImageEditorFilter, // 滤镜
  WTImageEditorWatermark // 水印
};

//MARK: -- collectionView的类型 Enum
typedef NS_ENUM(NSInteger, WTDisplayType)  {
  WTDisplayTypeSystemPhoto = 1, // 系统图片
  WTDisplayTypeSystemVideo, // 系统视频
  WTDisplayTypeDroneMedia, // 飞机
  WTDisplayTypeVideoMake, // 视频编辑选择界面
  WTDisplayTypeImageMake, // 图片编辑
  WTDisplayTypeDroneGallery // 飞机图库
};

//MARK: -- 饱和度,对比度,亮度子模块的类型 Enum
typedef NS_ENUM(NSInteger, WTImageFineTurningType) {
  WTImageBrightnessType = 0, // 亮度
  WTImageConstrastType, // 对比度
  WTImageSaturationType, // 饱和度
};

//MARK: -- 裁剪框类型 Enum
typedef NS_ENUM(NSInteger, WTCropScaleType) {
  WTCropScaleOneToOne, // 1:1
  WTCropScaleFourToThree, // 4:3
  WTCropScaleThreeToFour, // 3:4
  WTCropScaleSixteenToNine, // 16:9
  WTCropScaleNineToSixteen, // 9:16
  WTCropScaleCustom, // 自由
};

#pragma mark - 相机设置
//MARK: -- 列表视图类型 Enum
typedef NS_ENUM(NSInteger, WTCameraSettingViewType){
  WTCameraSettingViewTypeCameraSetting = 0, //相机设置主界面
  WTCameraSettingViewTypeAbout              //关于
};

//MARK: -- 设置飞机r类型 Enum
typedef NS_ENUM(NSInteger, WTDroneType){
  WTDroneTypeFireBird,
  WTDroneTypeBreeze2,
  WTDroneTypeTyphoonQ
};

//MARK: -- 设置进度条样式
typedef NS_ENUM(NSInteger, WTFB_ProgressViewType){
  WTFB_ProgressViewTypeHorizontal,
  WTFB_ProgressViewTypeVertical
};

//MARK: -- 设置进度条颜色
typedef NS_ENUM(NSInteger, WTFB_ProgressViewColorType) {
  WTFB_ProgressViewColorTypeDark,
  WTFB_ProgressViewColorTypeLittle
};

//MARK: -- 遥控器状态
typedef NS_ENUM(NSInteger, WTRC_State) {
  WTRC_StateEnterBindMode,
  WTRC_StateExitBindMode
};

//MARK: --  Meida Type
typedef NS_ENUM (NSInteger, WTMediaType) {
  /**
   Unknown
   */
  WTMediaTypeUnknown,
  /**
   JPEG
   */
  WTMediaTypeJPEG,
  /**
   DNG
   */
  WTMediaTypeDNG,
  /**
   MP4
   */
  WTMediaTypeMP4,
  /**
   2nd, preview video
   */
  WTMediaType2nd,
  /**
   thm, thumbnail
   */
  WTMediaTypeThm,
};




typedef NS_ENUM(NSInteger, WTPlayerMode) {
  WTPlayerModeFullScreen,
  WTPlayerModeNoFullScreen
};

typedef NS_ENUM(NSInteger, WTDownloadWindowMode) {
  WTDownloadWindowModeHorizontal,
  WTDownloadWindowModeVertical
};
/*--------------------------- Add by Hank End ----------------------------*/

#endif /* WTEnum_h */
