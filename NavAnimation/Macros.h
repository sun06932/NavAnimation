//
//  Macros.h
//  DailyClassic
//
//  Created by lanou on 15/7/20.
//  Copyright (c) 2015年 Sun. All rights reserved.
//

#ifndef DailyClassic_Macros_h
#define DailyClassic_Macros_h

//屏幕宽度
#define MainWidth [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define MainHeight [UIScreen mainScreen].bounds.size.height
// 导航栏和状态栏的高度
#define NaviHeight 64
// TabBar高度
#define TabBarHeight 49

//屏幕
#define MainScreen [UIScreen mainScreen].bounds
#define iconBack @"back_arrow"

//color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define kScreenWidthRatio  (MainWidth / 375)
#define kScreenHeightRatio (MainHeight / 667)
#define AdaptedW(x)  (ceilf((x) * kScreenWidthRatio))
#define AdaptedH(x) (ceilf((x) * kScreenHeightRatio))
#define kUHSystemFontWithSize(R)     [UIFont fontWithName: kULSystemFont size: (AdaptedW(R))]


#endif
