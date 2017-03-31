//
//  ZXYDragView.h
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/12.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXYDragView : UIView

//是否允许滑动
@property (nonatomic, assign) BOOL dragEnabled;

//自动吸附在周围
@property (nonatomic, assign) BOOL autoAdsorption;

@end
