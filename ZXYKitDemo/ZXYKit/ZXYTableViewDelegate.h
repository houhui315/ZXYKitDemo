//
//  ZXYTableViewDelegate.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef CGFloat(^TableViewHeightForRowAtIndexPathCallBack)(UITableView* tableView, NSIndexPath *indexPath);
typedef void(^TableViewDidSelectRowAtIndexPathCallBack)(UITableView* tableView, NSIndexPath *indexPath);



@interface ZXYTableViewDelegate : NSObject <UITableViewDelegate>

- (void)addDelegateWithTarget:(id)target;

- (instancetype)initWithHeightForRowAtIndexPath:(TableViewHeightForRowAtIndexPathCallBack)heightCallBack didSelectRowAtIndexPath:(TableViewDidSelectRowAtIndexPathCallBack)selectCallBack;

@end
