//
//  NSObject+SecureMappingKit.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSObject+SecureMappingKit.h"
#import "NSValueTransformer+SecureMappingKit.h"

//Transformer Classes
#import "SecureMappingKitTransformers.h"

@implementation NSObject (SecureMappingKit)

+ (NSNumber *)numberFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSNumberTransformer.class];
    return (NSNumber *)[transformer transformedValue:obj];
}

+ (NSNumber *)boolNumberFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSBooleanNumberTransformer.class];
    return (NSNumber *)[transformer transformedValue:obj];
}

+ (NSDecimalNumber *)decimalNumberFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSDecimalNumberTransformer.class];
    return (NSDecimalNumber *)[transformer transformedValue:obj];
}

+ (NSString *)stringFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSStringTransformer.class];
    return (NSString *)[transformer transformedValue:obj];
}

+ (NSURL *)urlFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSURLTransformer.class];
    return (NSURL *)[transformer transformedValue:obj];
}

+ (NSArray *)arrayFromObject:(id)obj
{
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:NSArrayTransformer.class];
    return (NSArray *)[transformer transformedValue:obj];
}

+ (NSDate *)dateFromObject:(id)obj usingDateFormat:(NSString *)dateFormat
{
    if (dateFormat == nil) {
        NSAssert(dateFormat==nil, @"dateFormat can't be nil");
        return nil;
    }
    
    Class transformerClass = NSDateTransformer.class;
    NSValueTransformer *transformer = [NSValueTransformer threadSavedTransformerFromClass:transformerClass
                                                               withDateFormat:dateFormat];
    return [transformer transformedValue:obj];
}

@end

