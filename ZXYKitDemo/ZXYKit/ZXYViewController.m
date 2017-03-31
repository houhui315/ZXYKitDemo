//
//  ZXYViewController.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYViewController.h"

@interface ZXYViewController ()

@property (nonatomic, copy) ZXYCallBack backCallBack;

@end

@implementation ZXYViewController

- (void)dealloc{
    
    _backCallBack = nil;
}

- (void)setUpBackButton{
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onBackTouch:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)onBackTouch:(id)sender{
    
    //如果是presnet进入的则dismiss返回
    if (self.presentingViewController) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        //如果是push进入的则pop返回
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self runBackBlock];
}

- (void)setUpBackButtonWithCallBack:(ZXYCallBack)callback{

    [self setUpBackButton];
    
    if (callback) {
        self.backCallBack = callback;
    }
}

- (void)runBackBlock{
    
    if (self.backCallBack) {
        self.backCallBack();
    }
}

- (void)initBackGroundColor{
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBackGroundColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
