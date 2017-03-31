//
//  ZXYAttributeSizeCalculater.m
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2016/10/26.
//  Copyright © 2016年 蓝泰致铭. All rights reserved.
//

#import "ZXYAttributeSizeCalculater.h"

@interface ZXYAttributeSizeCalculater ()

@property (nonatomic, strong) UITextView *sharedTextView;

@property (nonatomic, strong) UILabel *sharedLabel;

@end

@implementation ZXYAttributeSizeCalculater

+(ZXYAttributeSizeCalculater*)sharedInstance {
    
    static ZXYAttributeSizeCalculater *sharedManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedManagerInstance = [[self alloc] init];
        sharedManagerInstance.sharedTextView = [UITextView new];
        sharedManagerInstance.sharedLabel = [UILabel new];
        sharedManagerInstance.sharedLabel.numberOfLines = 0;
    });
    return sharedManagerInstance;
}

- (CGSize)textViewSizeForAttributedString:(NSAttributedString *)attributedString width:(CGFloat)contentWith{
    
    self.sharedTextView.attributedText = attributedString;
    CGSize size = [self.sharedTextView sizeThatFits:CGSizeMake(contentWith, CGFLOAT_MAX)];
    return size;
}

- (CGSize)labelSizeForAttributedString:(NSAttributedString *)attributedString width:(CGFloat)contentWith {
    
    self.sharedLabel.attributedText = attributedString;
    CGSize size = [self.sharedLabel sizeThatFits:CGSizeMake(contentWith, CGFLOAT_MAX)];
    return size;
}

- (CGSize)textViewSizeForContent:(NSString*)content font:(UIFont*)font width:(CGFloat)contentWidth {
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:content attributes:attribute];
    
    return [self textViewSizeForAttributedString:attributeString width:contentWidth];
}

- (CGSize)labelSizeForContent:(NSString*)content font:(UIFont*)font width:(CGFloat)contentWidth {
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:content attributes:attribute];
    
    return [self labelSizeForAttributedString:attributeString width:contentWidth];
}

@end
