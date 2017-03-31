//
//  ZXYFileEncrypt.m
//  moviePlayerDemo
//
//  Created by houhui  on 16/7/12.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//

#import "ZXYFileEncrypt.h"

static const int KeyCount = 100;

static const char arrayForEncode[KeyCount] = "zhixueyun2016+-*/";

@implementation ZXYFileEncrypt

+ (void)encryptWithFilePath:(NSString *)filePath toEncryptFilePath:(NSString *)encryptFilePath{
    
    NSData *imageDataOrigin = [NSData dataWithContentsOfFile:filePath];
    // 对前1000位进行异或处理
    unsigned char * cByte = (unsigned char*)[imageDataOrigin bytes];
    for (int index = 0; (index < [imageDataOrigin length]) && (index < KeyCount); index++, cByte++){
        *cByte = (*cByte) ^ arrayForEncode[index];
    }
    [imageDataOrigin writeToFile:encryptFilePath atomically:YES];
}

+ (void)decryptWithFilePath:(NSString *)filePath toDecryptFilePath:(NSString *)decryptFilePath {
    
    // 读取被加密文件对应的数据
    NSData *dataEncoded = [NSData dataWithContentsOfFile:filePath];
    // 对前1000位进行异或处理
    unsigned char * cByte = (unsigned char*)[dataEncoded bytes];
    for (int index = 0; (index < [dataEncoded length]) && (index < KeyCount); index++, cByte++){
        *cByte = (*cByte) ^ arrayForEncode[index];
    }
    [dataEncoded writeToFile:decryptFilePath atomically:YES];
}


@end
