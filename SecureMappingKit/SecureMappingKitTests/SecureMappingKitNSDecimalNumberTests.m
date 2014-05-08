//
//  SecureMappingKitNSDecimalNumberTests.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecureMappingKit.h"

@interface SecureMappingKitNSDecimalNumberTests : XCTestCase

@end

@implementation SecureMappingKitNSDecimalNumberTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSDecimalNumberTransformerWithDecimalSeparatorComa
{
    NSString *decimalWithComa = @"1800,98";
    NSDecimalNumber *d = [[NSDecimalNumber alloc] initWithDecimal:[@(1800.98f) decimalValue]];

    /**
     *  Validate NSDecimalNumberTransformerWithDecimalSeparatorComa
     */
    NSDictionary *testDict = @{@"balance": decimalWithComa};
    id result = [testDict objectForKey:@"balance" expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformerWithDecimalSeparatorComa.class];
    XCTAssertEqualObjects(result,d, @"Should have matched");
}

- (void)testNSDecimalNumberTransformerWithDecimalSeparatorPoint
{
    NSString *decimalWithPoint = @"1800.98";
    NSDecimalNumber *d = [[NSDecimalNumber alloc] initWithDecimal:[@(1800.98f) decimalValue]];

    /**
     *  Validate NSDecimalNumberTransformerWithDecimalSeparatorPoint
     */
    NSDictionary *testDict = @{@"balance": decimalWithPoint};
    id result = [testDict objectForKey:@"balance" expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformerWithDecimalSeparatorPoint.class];
    XCTAssertEqualObjects(result,d, @"Should have matched");
}

- (void)testNSDecimalNumberTransformer
{
    NSString *decimalWithPoint = @"1800.98";
    NSString *decimalWithComa = @"1800,98";
    NSNumber *number = @(1800.98f);
    NSDecimalNumber *d = [[NSDecimalNumber alloc] initWithDecimal:[@(1800.98f) decimalValue]];
    
    /**
     *  Validate NSDecimalNumberTransformer
     */
    NSDictionary *testDict = @{@"balance": number};
    id result = [testDict objectForKey:@"balance" expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformer.class];
    XCTAssertEqualObjects(result,d, @"Should have matched");
    
    testDict = @{@"balance": decimalWithComa};
    result = [testDict objectForKey:@"balance" expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformer.class];
    XCTAssertEqualObjects(result,d, @"Should have matched");
    
    testDict = @{@"balance": decimalWithPoint};
    result = [testDict objectForKey:@"balance" expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformer.class];
    XCTAssertEqualObjects(result,d, @"Should have matched");
}

@end
