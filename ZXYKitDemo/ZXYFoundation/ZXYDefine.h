//
//  ZXYDefine.h
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/25.
//  Copyright © 2016年 houhui. All rights reserved.
//

#ifndef ZXYDefine_h
#define ZXYDefine_h

#define CurrMode                     [UIScreen instancesRespondToSelector:@selector(currentMode)]
#define ModelSize                    [[UIScreen mainScreen] currentMode].size
#define iPhone4_4S                   (CurrMode? CGSizeEqualToSize(CGSizeMake(640, 960), ModelSize) : NO)
#define iPhone5_5S_5C                (CurrMode? CGSizeEqualToSize(CGSizeMake(640, 1136), ModelSize) : NO)
#define iPhone6_6S                   (CurrMode? CGSizeEqualToSize(CGSizeMake(750, 1334), ModelSize) : NO)
#define iPhone6plus_6Splus           (CurrMode? CGSizeEqualToSize(CGSizeMake(1242, 2208), ModelSize) : NO)
#define iPhone6ZoomMode              (CurrMode? CGSizeEqualToSize(CGSizeMake(640, 1136),ModelSize):NO)
#define iPhone6plusZoomMode          (CurrMode? CGSizeEqualToSize(CGSizeMake(1125, 2001),ModelSize):NO)


//屏幕宽度
#define kZXYScreenSizeWidth [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define kZXYScreenSizeHeight [UIScreen mainScreen].bounds.size.height

//状态栏高度
#define kZXYStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

//导航栏高度
#define kZXYNavigationBarHeight 44.f

//TabBar高度
#define kZXYTabBarHeight 49.f;

//展示导航栏的view高度
#define kZXYShowNavBarHeight (kZXYScreenSizeHeight-kZXYStatusBarHeight-kZXYNavigationBarHeight)

//展示导航栏和TabBar的view高度
#define kZXYShowNavVarShowTabBaeHeight (kZXYScreenSizeHeight-kZXYStatusBarHeight-kZXYNavigationBarHeight-kZXYTabBarHeight)


#endif /* ZXYDefine_h */
