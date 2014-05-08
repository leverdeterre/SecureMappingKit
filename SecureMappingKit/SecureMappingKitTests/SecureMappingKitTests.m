//
//  SecureMappingKitTests.m
//  SecureMappingKitTests
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JMOnePerson.h"
#import "SecureMappingKit.h"

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

- (void)testComplexData
{
    [NSDateFormatter setForcedlocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
    [NSDateFormatter setForcedTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];

    NSDictionary *testDict = @{
                               @"id": @(12345),
                               @"isActive": @"1",
                               @"balance": @"1900.01",
                               @"birthDate": @"07/26/1982"
                               };
    
    JMOnePerson *person = [JMOnePerson new];
    [person decodeObjectWithDictionary:testDict];
    
    XCTAssertEqualObjects(person.identifier,@"12345", @"Should have matched");
    XCTAssertEqual(person.isActive,TRUE, @"Should have matched");
    
    NSDecimalNumber *d = [[NSDecimalNumber alloc] initWithDecimal:[@(1900.01f) decimalValue]];
    
    //XCTAssertEqual(person.balance,1900.01, @"Should have matched");
    XCTAssertEqualObjects(person.balanceDecimalNumber,d, @"Should have matched");
}


@end
