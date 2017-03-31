//
//  ZXYKitDemoTests.m
//  ZXYKitDemoTests
//
//  Created by 蓝泰致铭        on 16/7/8.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZXYCheckValue.h"

@interface ZXYKitDemoTests : XCTestCase

@end

@implementation ZXYKitDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testNull{
    
    id string = nil;
    id string2 = Nil;
    id string3 = NULL;
    id string4 = [NSNull null];
    
    XCTAssertTrue([ZXYCheckValue isNullValue:string]);
    XCTAssertTrue([ZXYCheckValue isNullValue:string2]);
    XCTAssertTrue([ZXYCheckValue isNullValue:string3]);
    XCTAssertTrue([ZXYCheckValue isNullValue:string4]);
}

- (void)testString{
    
    NSString *string = nil;
    NSString *string2 = @"";
    NSString *string3 = NULL;
    NSString *string4 = [NSNull null];
    NSString *string5 = @"(null)";
    NSString *string6 = @"<null>";
    NSString *string7 = @" ";
    NSString *string8 = @"NULL";
    NSString *string9 = @"  ";
    
    XCTAssertTrue([ZXYCheckValue isEmptyString:string]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string2]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string3]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string4]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string5]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string6]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string7]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string8]);
    XCTAssertTrue([ZXYCheckValue isEmptyString:string9]);
}

- (void)testNumber{
    
    id string = nil;
    id string2 = Nil;
    id string3 = NULL;
    id string4 = [NSNull null];
    id string6 = @"1";
    
    XCTAssertTrue([ZXYCheckValue isEmptyNumber:string]);
    XCTAssertTrue([ZXYCheckValue isEmptyNumber:string2]);
    XCTAssertTrue([ZXYCheckValue isEmptyNumber:string3]);
    XCTAssertTrue([ZXYCheckValue isEmptyNumber:string4]);
    XCTAssertTrue([ZXYCheckValue isEmptyNumber:string6]);
}

- (void)testArray{
    
    id array = nil;
    id array2 = Nil;
    id array3 = NULL;
    id array4 = [NSNull null];
    id array5 = [NSDictionary dictionary];
    id array6 = [NSArray array];
    id array7 = [NSDictionary dictionaryWithObjectsAndKeys:@"11",@"es",nil];
    
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array2]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array3]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array4]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array5]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array6]);
    XCTAssertTrue([ZXYCheckValue isEmptyArray:array7]);
}

- (void)testDictionary{
    
    id array = nil;
    id array2 = Nil;
    id array3 = NULL;
    id array4 = [NSNull null];
    id array5 = [NSDictionary dictionary];
    id array6 = [NSArray array];
    id array7 = [NSArray arrayWithObjects:@"11",@"es",nil];
    
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array2]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array3]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array4]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array5]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array6]);
    XCTAssertTrue([ZXYCheckValue isEmptyDictionary:array7]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
