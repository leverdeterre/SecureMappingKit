//
//  NSNumberTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSNumberTransformer.h"

@implementation NSNumberTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
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
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
        
    if ([value respondsToSelector:@selector(floatValue)]) {
        return [NSNumber numberWithFloat:[value floatValue]];
    }

    return nil;
}

@end
