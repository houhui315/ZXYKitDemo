//
//  ZXYTabBarViewController.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTabBarViewController.h"
#import "ZXYTabBar.h"

@interface ZXYTabBarViewController () <ZXYTabBarDelegate>

@property (nonatomic, copy) ZXYTabBarShouldSelectedIndexCallBack shouSelectCallBack;
@property (nonatomic, copy) ZXYTabBarDidSelectedIndexCallBack didSelectCallBack;

@end

@implementation ZXYTabBarViewController

- (void)dealloc{
    
    for (ZXYViewController *vc in _viewControllers) {
        [vc removeFromParentViewController];
        [vc.view removeFromSuperview];
    }
    _viewControllers = nil;
    _shouSelectCallBack = nil;
    _didSelectCallBack = nil;
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    
    _viewControllers = viewControllers;
    
    [self initTabBar];
    [self showViewControllerWithIndex:0];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    [self.tabBar checkSelectWithIndex:selectedIndex];
}

- (void)shouldSelectedCallBack:(ZXYTabBarShouldSelectedIndexCallBack)callBack{
    
    self.shouSelectCallBack = callBack;
}

- (void)didSelectedCallBack:(ZXYTabBarDidSelectedIndexCallBack)callBack{
    
    self.didSelectCallBack = callBack;
}

- (void)initTabBar{
    
    CGRect rect = self.view.frame;
    rect.size.height -= 64;
    [self.view setFrame:rect];
    
    NSMutableArray *vcItems = [NSMutableArray array];
    for (NSInteger i = 0; i < [self.viewControllers count]; i++) {
        
        ZXYViewController *viewController = self.viewControllers[i];
        ZXYTabBarItem *item = viewController.tabBarItem;
        if (item) {
            [vcItems addObject:item];
        }else{
            [vcItems addObject:[NSNull null]];
        }
    }
    
    ZXYTabBar *tabBar = [[ZXYTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49)];
    tabBar.delegate = self;
    [tabBar setItems:vcItems];
    [self.view addSubview:tabBar];
    self.tabBar = tabBar;
}

- (void)showViewControllerWithIndex:(NSInteger)index {
    
    ZXYViewController *viewController = self.viewControllers[index];
    if (!viewController.view.superview) {
        
        [viewController.view setFrame:self.view.bounds];
        [self.view addSubview:viewController.view];
        [self addChildViewController:viewController];
    }
    [self.view bringSubviewToFront:viewController.view];
    [self.view bringSubviewToFront:self.tabBar];
}

#pragma mark ZXYTabBarDelegate methods

- (BOOL)tabBar:(ZXYTabBar *)tabBar shouldSelectItem:(ZXYTabBarItem *)item{
    
    NSUInteger index = [tabBar.items indexOfObject:item];
    if (self.shouSelectCallBack) {
        
        BOOL shouldSelect = self.shouSelectCallBack(self, index);
        if (!shouldSelect) {
            return NO;
        }
    }
    return YES;
}

- (void)tabBar:(ZXYTabBar *)tabBar didSelectItem:(ZXYTabBarItem *)item{
    
    NSUInteger index = [tabBar.items indexOfObject:item];
    _selectedIndex = index;
    _selectedViewController = self.viewControllers[index];
    [self showViewControllerWithIndex:index];
    
    if (self.didSelectCallBack) {
        self.didSelectCallBack(self, index);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
