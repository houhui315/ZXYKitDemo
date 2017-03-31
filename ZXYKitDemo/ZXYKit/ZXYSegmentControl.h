//
//  ZXYSegmentControl.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/4.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYControl.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZXYSegmentSelectCallBack)(NSUInteger index);

@interface ZXYSegmentControl : ZXYControl

- (instancetype)initWithFrame:(CGRect)frame Items:(nullable NSArray *)items; // items must be NSString Array

@property(nonatomic,readonly) NSUInteger numberOfSegments;

@property(nonatomic) NSInteger selectedSegmentIndex;

- (void)setSelectCallBack:(ZXYSegmentSelectCallBack)callBak;

@end

NS_ASSUME_NONNULL_END
