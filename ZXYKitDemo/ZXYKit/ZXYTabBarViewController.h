//
//  ZXYTabBarViewController.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class ZXYTabBarViewController;

typedef BOOL(^ZXYTabBarShouldSelectedIndexCallBack)(ZXYTabBarViewController *tabBarController, NSUInteger index);

typedef void(^ZXYTabBarDidSelectedIndexCallBack)(ZXYTabBarViewController *tabBarController, NSUInteger index);

@class ZXYTabBar;

@interface ZXYTabBarViewController : ZXYViewController

@property(nullable, nonatomic,copy) NSArray<__kindof ZXYViewController *> *viewControllers;

- (void)shouldSelectedCallBack:(ZXYTabBarShouldSelectedIndexCallBack)callBack;
- (void)didSelectedCallBack:(ZXYTabBarDidSelectedIndexCallBack)callBack;

@property(nullable, nonatomic, assign) __kindof ZXYViewController *selectedViewController; // This may return the "More" navigation controller if it exists.
@property(nonatomic) NSUInteger selectedIndex;

@property(nonatomic,strong) ZXYTabBar *tabBar NS_AVAILABLE_IOS(3_0); // Provided for -[UIActionSheet showFromTabBar:]. Attempting to modify the contents of the tab bar directly will throw an exception.

@property(nullable, nonatomic,weak) id<UITabBarControllerDelegate> delegate;


@end

@class ZXYTabBarItem, ZXYTabBarController;
@interface ZXYViewController (ZXYTabBarControllerItem)

@property(null_resettable, nonatomic, strong) ZXYTabBarItem *tabBarItem; // Automatically created lazily with the view controller's title if it's not set explicitly.

@end

NS_ASSUME_NONNULL_END
