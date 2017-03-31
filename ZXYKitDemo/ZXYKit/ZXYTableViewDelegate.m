//
//  ZXYTableViewDelegate.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTableViewDelegate.h"

@interface ZXYTableViewDelegate ()<NSCopying>

@property (nonatomic, assign) id <UITableViewDelegate> delegate;

@property (nonatomic, copy) TableViewHeightForRowAtIndexPathCallBack heightCallBack;
@property (nonatomic, copy) TableViewDidSelectRowAtIndexPathCallBack selectCallBack;

@end

@implementation ZXYTableViewDelegate

- (void)dealloc{
    
    _heightCallBack = nil;
    _selectCallBack = nil;
}

-(id)copyWithZone:(NSZone *)zone{
    
    ZXYTableViewDelegate *copy = [ZXYTableViewDelegate allocWithZone:zone];
    copy.heightCallBack = _heightCallBack;
    copy.selectCallBack = _selectCallBack;
    return self;
}

- (void)addDelegateWithTarget:(id)target{
    
    _delegate = target;
}

- (instancetype)initWithHeightForRowAtIndexPath:(TableViewHeightForRowAtIndexPathCallBack)heightCallBack didSelectRowAtIndexPath:(TableViewDidSelectRowAtIndexPathCallBack)selectCallBack{
    
    if ([super init]) {
        _heightCallBack = heightCallBack;
        _selectCallBack = selectCallBack;
    }
    
    return self;
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.heightCallBack) {
        return self.heightCallBack(tableView, indexPath);
    }else{
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20.f;
}

// Section header & footer information. Views are preferred over title should you decide to provide both

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    return view;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.selectCallBack) {
        self.selectCallBack(tableView, indexPath);
    }
}

@end
