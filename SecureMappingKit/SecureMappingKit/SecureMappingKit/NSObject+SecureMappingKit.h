//
//  NSObject+SecureMappingKit.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SecureMappingKit)

+ (NSNumber *)numberFromObject:(id)obj;
+ (NSNumber *)boolNumberFromObject:(id)obj;
+ (NSDecimalNumber *)decimalNumberFromObject:(id)obj;
+ (NSString *)stringFromObject:(id)obj;
+ (NSURL *)urlFromObject:(id)obj;
+ (NSArray *)arrayFromObject:(id)obj;
+ (NSDate *)dateFromObject:(id)obj usingDateFormat:(NSString *)dateFormat;

@end
