//
//  SecondViewController.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "SecondViewController.h"
#import "ZXYSegmentControl.h"
#import "ZXYTableViewDelegate.h"
#import "ZXYTableViewDataSource.h"
#import "ZXYTableView.h"
#import "sampleCell.h"
#import "UIButton+ZXYCatagory.h"


@interface SecondViewController (){
    
    ZXYTableView *myTableView;
}

@property (nonatomic, copy) ZXYTableViewDelegate *delegate;
@property (nonatomic, copy) ZXYTableViewDataSource *dataSource;

@end

@implementation SecondViewController

- (void)dealloc{
    
    _delegate = nil;
    _dataSource = nil;
    NSLog(@"SecondViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
//    [self setUpBackButton];
    [self setUpBackButtonWithCallBack:^{
        NSLog(@"返回");
    }];
    
    [self initSegmentControl];
    [self initTableView];
    
    UIButton *button = [UIButton initWithframe:CGRectMake(100, 100, 100, 100) font:[UIFont systemFontOfSize:17.f] textColor:[UIColor blueColor] backgroundColor:[UIColor redColor] title:@"哈哈" touchEventWithCallBack:^{
        
        NSLog(@"touch");
    }];
    [self.view addSubview:button];
}

- (void)initTableView{
    
    NSMutableArray *allArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        
        sampleModel *model = [sampleModel new];
        model.name = [NSString stringWithFormat:@"张三%ld",i];
        if (i %2) {
            model.sex = @"男";
        }else{
            model.sex = @"女";
        }
        model.age = [NSString stringWithFormat:@"%ld",10+i];
        [allArray addObject:model];
    }
    
    self.dataSource = [[ZXYTableViewDataSource alloc] initWithDataArray:allArray cellClass:[sampleCell class] callBack:^(UITableView *tableView, sampleCell *cell, sampleModel *model, NSUInteger index) {
        
        [cell configureForModel:model];
        [cell registerEvent:EventType_Button1Touch callBack:^(NSDictionary *params) {
            NSLog(@"row=%ld button1Touch",index);
        }];
        [cell registerEvent:EventType_Button2Touch callBack:^(NSDictionary *params) {
            NSLog(@"row=%ld button2Touch",index);
        }];
        [cell registerEvent:EventType_Button3Touch callBack:^(NSDictionary *params) {
            NSLog(@"row=%ld button3Touch",index);
        }];
    }];
    
    self.delegate = [[ZXYTableViewDelegate alloc] initWithHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 44.f;
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"selectIndex =%ld",(long)indexPath.row);
    }];
    
    ZXYTableView *tableView = [[ZXYTableView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height - 40 - 49) style:UITableViewStylePlain];
    tableView.dataSource = _dataSource;
    tableView.delegate = _delegate;
    [tableView registerCellClass:[sampleCell class]];
    [self.view addSubview:tableView];
}

- (void)initSegmentControl {
    
    ZXYSegmentControl *control = [[ZXYSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40) Items:@[@"全部",@"最新",@"最热"]];
    [self.view addSubview:control];
    [control setSelectCallBack:^(NSUInteger index) {
        
        NSLog(@"selectIndex=%lu",(unsigned long)index);
    }];
    control.selectedSegmentIndex = 2;
}

#pragma mark

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
