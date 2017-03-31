//
//  ZXYTabBar.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYView.h"

NS_ASSUME_NONNULL_BEGIN

@class ZXYTabBarItem;
@class UIImageView;
@protocol ZXYTabBarDelegate;

@interface ZXYTabBar : ZXYView

@property(nullable,nonatomic,assign) id<ZXYTabBarDelegate> delegate;     // weak reference. default is nil
@property(nullable,nonatomic,copy) NSArray<ZXYTabBarItem *> *items;        // get/set visible UITabBarItems. default is nil. changes not animated. shown in order
@property(nullable,nonatomic,assign) ZXYTabBarItem *selectedItem; // will show feedback based on mode. default is nil

- (void)checkSelectWithIndex:(NSInteger)index;

@end

@protocol ZXYTabBarDelegate <NSObject>

@optional

- (BOOL)tabBar:(ZXYTabBar *)tabBar shouldSelectItem:(ZXYTabBarItem *)item;
- (void)tabBar:(ZXYTabBar *)tabBar didSelectItem:(ZXYTabBarItem *)item;

@end

NS_ASSUME_NONNULL_END
