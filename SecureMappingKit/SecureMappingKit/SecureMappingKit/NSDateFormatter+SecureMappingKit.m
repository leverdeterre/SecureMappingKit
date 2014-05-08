//
//  NSDateFormatter+SecureMappingKit.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDateFormatter+SecureMappingKit.h"
#import <objc/runtime.h>

@implementation NSDateFormatter (SecureMappingKit)

+ (instancetype)dateFormatterForDateFormat:(NSString *)dateFormat
{
    NSDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = nil;
    
    if (nil != dateFormat) {
        [threadDict objectForKey:dateFormat];
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            
            if ([self forcedTimeZone]) {
                dateFormatter.timeZone = [self forcedTimeZone];
            } else {
                dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
            }
            
            if ([self forcedLocale]) {
                dateFormatter.locale = [self forcedLocale];
            } else {
                dateFormatter.locale = [NSLocale currentLocale];
            }
            
            dateFormatter.dateFormat = dateFormat;
            [threadDict setValue:dateFormatter forKey:dateFormat];
        }
    }
    
    return dateFormatter;
}

+ (void)setForcedTimeZone:(NSTimeZone *)forcedTimeZone
{
    objc_setAssociatedObject(self, @selector(forcedTimeZone), forcedTimeZone, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSTimeZone *)forcedTimeZone
{
    return objc_getAssociatedObject(self, _cmd);
}

+ (void)setForcedlocale:(NSLocale *)forcedLocale
{
    objc_setAssociatedObject(self, @selector(forcedLocale), forcedLocale, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSLocale *)forcedLocale
{
    return objc_getAssociatedObject(self, _cmd);
}


@end
