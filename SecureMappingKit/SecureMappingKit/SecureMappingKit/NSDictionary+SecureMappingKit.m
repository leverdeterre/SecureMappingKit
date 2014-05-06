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
    Class transformerClass;
    if(expectedClass == NSString.class) {
        transformerClass = NSStringTransformer.class;
    } else if (expectedClass == NSNumber.class) {
        transformerClass = NSNumberTransformer.class;
    } else if (expectedClass == NSArray.class) {
        transformerClass = NSArrayTransformer.class;
    } else if (expectedClass == NSURL.class) {
        transformerClass = NSURLTransformer.class;
    }  else if (expectedClass == NSDecimalNumber.class) {
        transformerClass = NSDecimalNumberTransformer.class;
    } else {
        transformerClass = NSValueTransformer.class;
    }
    
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
        return [[NSValueTransformer transformerForClass:transformerClass] transformedValue:obj];
    }
    
    return nil;
}

- (id)objectForKey:(id)aKey withTransformerBlock:(JMOTransformerBlock)transformerBlock
{
    return transformerBlock([self objectForKey:aKey]);
}

- (NSDate *)dateObjectForKey:(id)aKey withDateFormat:(NSString *)dateFromat
{
    id obj = [self objectForKey:aKey];
    if (aKey == nil) {
        NSAssert(aKey==nil, @"aKey can't be nil");
        return nil;
    }
    
    Class transformerClass = NSDateTransformer.class;
    NSValueTransformer *transformer = [NSValueTransformer transformerForClass:transformerClass
                                                               withDateFormat:dateFromat];
    return [transformer transformedValue:obj];
}


@end
