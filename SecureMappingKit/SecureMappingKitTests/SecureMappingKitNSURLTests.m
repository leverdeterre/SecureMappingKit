//
//  SecureMappingKitNSURLTests.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecureMappingKit.h"

@interface SecureMappingKitNSURLTests : XCTestCase

@end

@implementation SecureMappingKitNSURLTests

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


- (void)testURLValueTransformers
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"http://www.google.fr" forKey:@"url"];
    
    id url = [dict objectForKey:@"url" expectedClass:[NSURL class]];
    XCTAssertEqualObjects(url, [NSURL URLWithString:@"http://www.google.fr"], @"Should have matched");
    
    id transformedValue = [dict objectForKey:@"url" withTransformerBlock:^id(id value) {
        if ([value isKindOfClass:[NSURL class]]) {
            return value;
        }
        if ([value isKindOfClass:[NSString class]]) {
            return [NSURL URLWithString:value];
        }
        return nil;
    }];
    XCTAssertEqualObjects(transformedValue, [NSURL URLWithString:@"http://www.google.fr"], @"Should have matched");
}
@end
