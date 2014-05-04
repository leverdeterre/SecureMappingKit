//
//  SecureMappingKitTests.m
//  SecureMappingKitTests
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JMOnePerson.h"
#import "NSDictionary+SecureMappingKit.h"

@interface SecureMappingKitTests : XCTestCase

@end

@implementation SecureMappingKitTests

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


- (void)test1
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"webservice.response.1"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:kNilOptions
                                                error:&error];
    
    NSDictionary *dict = [json firstObject];
    JMOnePerson *person = [JMOnePerson new];
    [person setupWithDictionary:dict];
    XCTAssertEqualObjects(person.identifier, @"0", @"Should have matched");
    XCTAssertEqual(person.isActive, NO, @"Should have matched");
    XCTAssertEqualWithAccuracy(person.balance, 1508.63, 0.001,@"Should have matched");
}

- (void)test2
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"webservice.response.2"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:kNilOptions
                                                error:&error];
    
    NSDictionary *dict = [json firstObject];
    JMOnePerson *person = [JMOnePerson new];
    [person setupWithDictionary:dict];
    
    XCTAssertEqualObjects(person.identifier, @"1", @"Should have matched");
    XCTAssertEqual(person.isActive, NO, @"Should have matched");
    XCTAssertEqualWithAccuracy(person.balance, 2633.59,0.001, @"Should have matched");
}

- (void)test3
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"webservice.response.3"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:kNilOptions
                                                error:&error];
    
    NSDictionary *dict = [json firstObject];
    JMOnePerson *person = [JMOnePerson new];
    [person setupWithDictionary:dict];
    
    XCTAssertEqualObjects(person.identifier, @"2", @"Should have matched");
    XCTAssertEqual(person.isActive, YES, @"Should have matched");
    XCTAssertEqualWithAccuracy(person.balance, 2946.54,0.001, @"Should have matched");
}

- (void)testCustomValues
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"12345" forKey:@"id"];
    [dict setObject:@"toto" forKey:@"name"];
    [dict setObject:@"http://www.google.fr" forKey:@"url"];
    
    id url = [dict objectForKey:@"url" expectedClass:[NSURL class]];
    XCTAssertEqualObjects(url, [NSURL URLWithString:@"http://www.google.fr"], @"Should have matched");
    
    id identifier = [dict objectForKey:@"id" expectedClass:[NSNumber class]];
    XCTAssertEqualObjects(identifier, @(12345), @"Should have matched");
    
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
