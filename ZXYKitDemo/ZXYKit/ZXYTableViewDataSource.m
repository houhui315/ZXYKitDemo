//
//  ZXYTableViewDataSource.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTableViewDataSource.h"

@interface ZXYTableViewDataSource (){
    
    NSString *cellIdentifier;
    Class cellClass;
}

@property (nonatomic, copy) ZXYTableViewDataSourceCallBack callBack;

@end

@implementation ZXYTableViewDataSource

- (void)dealloc{
    
    _callBack = nil;
}

-(id)copyWithZone:(NSZone *)zone{
    
    ZXYTableViewDataSource *copy = [ZXYTableViewDataSource allocWithZone:zone];
    copy.callBack = _callBack;
    return self;
}

- (instancetype)initWithDataArray:(NSArray*)dataArray cellClass:(Class)class callBack:(ZXYTableViewDataSourceCallBack)callBack{
    
    if ([super init]) {
        
        _items = dataArray;
        _callBack = callBack;
        cellClass = class;
        cellIdentifier = NSStringFromClass(class);
    }
    return self;
}

- (void)changeDataArray:(NSArray*)ary{
    
    _items = ary;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    _callBack(tableView,cell,_items[indexPath.row],indexPath.row);
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

@end
