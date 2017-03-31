//
//  FouthViewController.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "FouthViewController.h"
#import "ZXYSegmentControl.h"

@interface FouthViewController ()

@end

@implementation FouthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self setUpSegmentView];
}

- (void)setUpSegmentView{
    
    ZXYSegmentControl *control = [[ZXYSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40) Items:@[@"最新",@"最热"]];
    [self.view addSubview:control];
    [control setSelectCallBack:^(NSUInteger index) {
        
        NSLog(@"selectIndex=%lu",(unsigned long)index);
    }];
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
