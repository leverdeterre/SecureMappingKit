//
//  NSValueTransformer+WebServiceMapping.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSValueTransformer+SecureMappingKit.h"
#import "NSDateFormatter+SecureMappingKit.h"
#import "SecureMappingKitTransformers.h"

@implementation NSValueTransformer (SecureMappingKit)

+ (Class)transformerClassForExpectedClass:(Class)expectedClass
{
    Class transformerClass = NSValueTransformer.class;
    
    if(expectedClass == NSString.class) {
        transformerClass = NSStringTransformer.class;
    } else if (expectedClass == NSNumber.class) {
        transformerClass = NSNumberTransformer.class;
    } else if (expectedClass == NSArray.class) {
        transformerClass = NSArrayTransformer.class;
    } else if (expectedClass == NSURL.class) {
        transformerClass = NSURLTransformer.class;
    } else if (expectedClass == NSDecimalNumber.class) {
        transformerClass = NSDecimalNumberTransformer.class;
    } else if (expectedClass == NSDate.class) {
        transformerClass = NSDateTransformer.class;
    }
    
    return transformerClass;
}

+ (instancetype)threadSavedTransformerFromClass:(Class)transformerClass
{
    NSDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSValueTransformer *transformer = [threadDict objectForKey:NSStringFromClass(transformerClass)];
    
    if (nil == transformer) {
        transformer = [transformerClass new];
        [threadDict setValue:transformer forKey:NSStringFromClass(transformerClass)];
    }
    
    return transformer;
}

+ (instancetype)threadSavedTransformerFromClass:(Class)transformerClass withDateFormat:(NSString *)dateFormat
{
    NSDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSValueTransformer *transformer = [threadDict objectForKey:[NSString stringWithFormat:@"%@_%@",NSStringFromClass(transformerClass),dateFormat]];
    
    if (nil == transformer) {
        NSValueTransformer *dateTransformer = [transformerClass new];
        if ([dateTransformer respondsToSelector:@selector(setDateFormatter:)]) {
            NSValueTransformerWithDateFormat *transformerWithDateFormater = (NSValueTransformerWithDateFormat *)dateTransformer;
            transformerWithDateFormater.dateFormatter = [NSDateFormatter dateFormatterForDateFormat:dateFormat];
        }
        transformer = dateTransformer;
        [threadDict setValue:transformer forKey:dateFormat];
    }
    return transformer;
}


@end
