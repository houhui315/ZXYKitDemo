//
//  ZXYAttributeSizeCalculater.h
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2016/10/26.
//  Copyright © 2016年 蓝泰致铭. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZXYAttributeSizeCalculaterSharedInstance [ZXYAttributeSizeCalculater sharedInstance]

@interface ZXYAttributeSizeCalculater : NSObject

+(ZXYAttributeSizeCalculater*)sharedInstance;

//计算textView文本高度
- (CGSize)textViewSizeForAttributedString:(NSAttributedString *)attributedString width:(CGFloat)contentWith;

//计算label文本高度
- (CGSize)labelSizeForAttributedString:(NSAttributedString *)attributedString width:(CGFloat)contentWith;

- (CGSize)textViewSizeForContent:(NSString*)content font:(UIFont*)font width:(CGFloat)contentWidth;

- (CGSize)labelSizeForContent:(NSString*)content font:(UIFont*)font width:(CGFloat)contentWidth;

@end
