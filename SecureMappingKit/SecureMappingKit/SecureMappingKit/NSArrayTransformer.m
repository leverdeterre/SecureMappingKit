//
//  NSArrayTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSArrayTransformer.h"

@implementation NSArrayTransformer

+ (Class)transformedValueClass
{
    return [NSArray class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

//Transforming a Value
- (id)transformedValue:(id)value
{
    if (nil == value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    } else {
        return [NSArray arrayWithObject:value];
    }
    
    return nil;
}

@end
