//
//  NSValueTransformer+WebServiceMapping.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSValueTransformer+SecureMappingKit.h"
#import "NSDateTransformer.h"
#import "NSDateFormatter+SecureMappingKit.h"

@implementation NSValueTransformer (SecureMappingKit)

+ (instancetype)transformerForClass:(Class)transformerClass
{
    NSDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSValueTransformer *transformer = [threadDict objectForKey:NSStringFromClass(transformerClass)];
    
    if (nil == transformer) {
        transformer = [transformerClass new];
        [threadDict setValue:transformer forKey:NSStringFromClass(transformerClass)];
    }
    
    return transformer;
}

+ (instancetype)transformerForClass:(Class)transformerClass withDateFormat:(NSString *)dateFormat
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
