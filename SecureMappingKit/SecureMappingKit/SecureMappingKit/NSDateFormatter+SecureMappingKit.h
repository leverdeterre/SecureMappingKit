//
//  NSDateFormatter+SecureMappingKit.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SecureMappingKit)

+ (void)setForcedTimeZone:(NSTimeZone *)forcedTimeZone;
+ (NSTimeZone *)forcedTimeZone;

+ (void)setForcedlocale:(NSLocale *)forcedLocale;
+ (NSLocale *)forcedLocale;

+ (instancetype) dateFormatterForDateFormat:(NSString *)dateFormat;

@end
