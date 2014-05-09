//
//  NSDictionary+SecureMappingKit.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDictionary+SecureMappingKit.h"
#import "NSValueTransformer+SecureMappingKit.h"

@implementation NSDictionary (SecureMappingKit)

- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass
{
    Class transformerClass = [NSValueTransformer transformerClassForExpectedClass:expectedClass];
    return [self objectForKey:aKey expectedClass:expectedClass withTransformerClass:transformerClass];
}

- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass withTransformerClass:(Class)transformerClass
{
    if (aKey == nil) {
        NSAssert(aKey==nil, @"aKey can't be nil");
        return nil;
    }
    
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:expectedClass]) {
        return obj;
    } else {
        return [[NSValueTransformer threadSavedTransformerFromClass:transformerClass] transformedValue:obj];
    }
    
    return nil;
}

- (id)objectForKey:(id)aKey withTransformerBlock:(JMTransformerBlock)transformerBlock
{
    return transformerBlock([self objectForKey:aKey]);
}

- (NSNumber *)numberForKey:(id)aKey
{
    return (NSNumber *)[self objectForKey:aKey expectedClass:NSNumber.class withTransformerClass:NSNumberTransformer.class];
}

- (NSNumber *)boolNumberForKey:(id)aKey
{
    return (NSNumber *)[self objectForKey:aKey expectedClass:NSNumber.class withTransformerClass:NSBooleanNumberTransformer.class];
}

- (NSDecimalNumber *)decimalNumberForKey:(id)aKey
{
    return (NSDecimalNumber *)[self objectForKey:aKey expectedClass:NSDecimalNumber.class withTransformerClass:NSDecimalNumberTransformer.class];
}

- (NSString *)stringForKey:(id)aKey
{
    return (NSString *)[self objectForKey:aKey expectedClass:NSString.class withTransformerClass:NSStringTransformer.class];
}

- (NSURL *)urlForKey:(id)aKey
{
    return (NSURL *)[self objectForKey:aKey expectedClass:NSURL.class withTransformerClass:NSURLTransformer.class];
}

- (NSArray *)arrayForKey:(id)aKey
{
    return (NSArray *)[self objectForKey:aKey expectedClass:NSArray.class withTransformerClass:NSArrayTransformer.class];
}

- (NSDate *)dateForKey:(id)aKey usingDateFormat:(NSString *)dateFormat
{
    id obj = [self objectForKey:aKey];
    if (aKey == nil) {
        NSAssert(aKey==nil, @"aKey can't be nil");
        return nil;
    }
    
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
