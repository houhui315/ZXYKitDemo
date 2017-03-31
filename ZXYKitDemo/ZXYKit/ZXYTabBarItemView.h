//
//  ZXYTabBarItemView.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYControl.h"

@class ZXYTabBarItem;

@interface ZXYTabBarItemView : ZXYControl

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;

- (instancetype)initWithFrame:(CGRect)frame andTabBarItem:(ZXYTabBarItem*)item;

@property (nonatomic, strong) ZXYTabBarItem *theItem;

- (void)setSelectStatus:(BOOL)status;

@end
