//
//  ZXYTabBarItem.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@class UIView, UIImage;

@interface ZXYTabBarItem : ZXYBarItem

- (instancetype)initWithTitle:(nullable NSString *)title image:(nullable UIImage *)image selectedImage:(nullable UIImage *)selectedImage;

//默认图片
@property(nullable, nonatomic,strong) UIImage *normalImage;
//高亮图片
@property(nullable, nonatomic,strong) UIImage *highlightImage;

@property(nullable, nonatomic, copy) NSString *badgeValue;    // default is nil

@end

NS_ASSUME_NONNULL_END
