//
//  PhoneInfoManager.h
//   
//
//  Created by Tony Stark on 2021/10/11.
//  Copyright © 2021 xiongmaitech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SafeArea_Deirection){
    SafeArea_Top,
    SafeArea_Bottom,
    SafeArea_Left,
    SafeArea_Right,
    SafeArea_Max,
};

NS_ASSUME_NONNULL_BEGIN

@interface PhoneInfoManager : NSObject

//MARK: 获取手机类型
+ (NSString *)getPhoneIdentifier;
//MARK: 获取手机屏幕对角线尺寸
+ (double)getMobilePhoneScreenDiagonalSize;
//MARK: 获取手机真实型号
+ (NSString *)getRealMobileModel;
//MARK: 获取手机物理尺寸
+ (CGSize)getRealResolutionRatioSize;
//MARK: 生成随机码
+ (NSString *)randomStringWithLength:(NSInteger)len;
//MARK: 获取手机刘海的高度
+ (CGFloat)heightOfBangs;
//MARK: 安全区域长度
+ (CGFloat)safeAreaLength:(SafeArea_Deirection)direction;

@end

NS_ASSUME_NONNULL_END
