//
//  ZXYTableViewDataSource.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ZXYTableViewDataSourceCallBack)(UITableView *tableView,id cell,id model, NSUInteger index);

@interface ZXYTableViewDataSource : NSObject <UITableViewDataSource>{
    
}

@property (nonatomic, copy) NSArray *items;

- (instancetype)initWithDataArray:(NSArray*)dataArray cellClass:(Class)class callBack:(ZXYTableViewDataSourceCallBack)callBack;

@end
