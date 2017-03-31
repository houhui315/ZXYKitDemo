//
//  ViewController.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FouthViewController.h"
#import "ZXYTabBarViewController.h"
#import "ZXYTabBarItem.h"
#import <UIKit/UIImage.h>
#import "UIButton+ZXYCatagory.h"
#import "ZXYDragView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"uitabbar" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonTouch:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"view" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTouch:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
//    UIButton *button = [UIButton initWithframe:CGRectMake(100, 100, 100, 100) font:[UIFont systemFontOfSize:17.f] textColor:[UIColor blueColor] backgroundColor:[UIColor redColor] title:@"哈哈" touchEventWithCallBack:^{
//        
//        NSLog(@"touch");
//    }];
//    [self.view addSubview:button];
    
    ZXYDragView *view = [[ZXYDragView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)leftButtonTouch:(id)sender{
    
    ThirdViewController *vc1 = [ThirdViewController new];
    vc1.tabBarItem = [[ZXYTabBarItem alloc] initWithTitle:@"已解决" image:[UIImage imageNamed:@"icon_tab_solve"] selectedImage:[UIImage imageNamed:@"icon_tab_solve_pre"]];
    vc1.title = @"vc1";
    FouthViewController *vc2 = [FouthViewController new];
    vc2.title = @"vc2";
    vc2.tabBarItem = [[ZXYTabBarItem alloc] initWithTitle:@"模拟考试" image:[UIImage imageNamed:@"icon_tab_simulation_test"] selectedImage:[UIImage imageNamed:@"icon_tab_simulation_test_pre"]];
    FouthViewController *vc3 = [FouthViewController new];
    vc3.title = @"vc2";
    vc3.tabBarItem = [[ZXYTabBarItem alloc] initWithTitle:@"模拟考试2" image:[UIImage imageNamed:@"icon_tab_simulation_test"] selectedImage:[UIImage imageNamed:@"icon_tab_simulation_test_pre"]];
    
    ZXYTabBarViewController *tabbarController = [ZXYTabBarViewController new];
    tabbarController.title = @"测试";
    [tabbarController setViewControllers:@[vc1,vc2,vc3]];
    [self.navigationController pushViewController:tabbarController animated:YES];
    [tabbarController setUpBackButton];
    [tabbarController shouldSelectedCallBack:^BOOL(ZXYTabBarViewController * _Nonnull tabBarController, NSUInteger index) {
        if (index == 2) {
            NSLog(@"不能选择");
            return NO;
        }
        return YES;
    }];
}

- (void)rightButtonTouch:(id)sender{
    
    SecondViewController *secondVC = [SecondViewController new];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
