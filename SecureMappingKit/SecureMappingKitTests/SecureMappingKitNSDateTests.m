//
//  SecureMappingKitNSDateTests.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecureMappingKit.h"

@interface SecureMappingKitNSDateTests : XCTestCase

@end

@implementation SecureMappingKitNSDateTests

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

- (void)testNSDateTransformer
{
    [SecureMappingKit setDateFormatterForcedlocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
    [SecureMappingKit setDateFormatterForcedTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];

    NSDictionary *testDict = @{@"birthDate": @"07/26/1982"};
    NSDate *date = [testDict dateForKey:@"birthDate" withDateFormat:@"MM/dd/yyyy"];
    NSTimeInterval interval = [date timeIntervalSince1970];
    XCTAssertEqual(interval, 396489600, @"Should have matched");
    
    NSString *rollBackStringDate = [date stringWithDateFormat:@"MM/dd/yyyy"];
    XCTAssertEqualObjects(rollBackStringDate, @"07/26/1982", @"Should have matched");

    NSDate *dateWithInterval = [NSDate dateWithTimeIntervalSince1970:396489600];
    XCTAssertEqualObjects(date, dateWithInterval, @"Should have matched");
}

@end
