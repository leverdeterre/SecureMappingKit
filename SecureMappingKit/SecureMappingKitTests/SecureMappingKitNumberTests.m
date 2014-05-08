//
//  SecureMappingKitNumberTests.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecureMappingKit.h"

@interface SecureMappingKitNumberTests : XCTestCase

@end

@implementation SecureMappingKitNumberTests

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

- (void)testBoolValueTransformer
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"false" forKey:@"isActiveString"];
    [dict setObject:@"1" forKey:@"isActiveStringV2"];
    [dict setObject:@(NO) forKey:@"isActiveNumber"];
    
    id bValue = [dict objectForKey:@"isActiveString" expectedClass:[NSNumber class] withTransformerClass:NSBooleanNumberTransformer.class];
    XCTAssertEqual(bValue, @(NO), @"Should have matched");
    
    bValue = [dict objectForKey:@"isActiveStringV2" expectedClass:[NSNumber class] withTransformerClass:NSBooleanNumberTransformer.class];
    XCTAssertEqual([bValue boolValue], [@(YES) boolValue], @"Should have matched");
    
    bValue = [dict objectForKey:@"isActiveNumber" expectedClass:[NSNumber class] withTransformerClass:NSBooleanNumberTransformer.class];
    XCTAssertEqual(bValue, @(NO), @"Should have matched");
}

- (void)testNumberValueTransformers
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"12345" forKey:@"id"];
    
    id identifier = [dict objectForKey:@"id" expectedClass:[NSNumber class]];
    XCTAssertEqualObjects(identifier, @(12345), @"Should have matched");
}

/*
 - (NSNumber *)numberForKey:(id)aKey;
 - (NSNumber *)boolNumberForKey:(id)aKey;
 */


@end
