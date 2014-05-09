//
//  NSObject+SecureMappingKit.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SecureMappingKit)

/**
 *  NSNumber
 */
+ (NSNumber *)numberFromObject:(id)obj;
+ (NSNumber *)boolNumberFromObject:(id)obj;

/**
 *  NSDecimalNumber
 */
+ (NSDecimalNumber *)decimalNumberFromObject:(id)obj;

/**
 *  NSString
 */
+ (NSString *)stringFromObject:(id)obj;

/**
 *  NSURL
 */
+ (NSURL *)urlFromObject:(id)obj;

/**
 *  NSArray
 */
+ (NSArray *)arrayFromObject:(id)obj;

/**
 *  NSDate
 */
+ (NSDate *)dateFromObject:(id)obj usingDateFormat:(NSString *)dateFormat;

@end
