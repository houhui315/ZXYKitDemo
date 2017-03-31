//
//  ZXYFileEncrypt.h
//  moviePlayerDemo
//
//  Created by houhui  on 16/7/12.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//
//
//  加密文件原理：读取原文件，用一个字符串与文件前面进行异或操作，得到加密文件
//  解密文件原理：读取加密文件，用一个字符串与文件前面进行异或操作，得到解密文件
//

#import <Foundation/Foundation.h>

@interface ZXYFileEncrypt : NSObject

+ (void)encryptWithFilePath:(NSString *)filePath toEncryptFilePath:(NSString *)encryptFilePath;

+ (void)decryptWithFilePath:(NSString *)filePath toDecryptFilePath:(NSString *)decryptFilePath;

@end
