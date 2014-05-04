//
//  NSURLTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSURLTransformer.h"

@implementation NSURLTransformer

+ (Class)transformedValueClass
{
    return [NSURL class];
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
    
    if ([value isKindOfClass:[NSURL class]]) {
        return value;
    }

    if ([value isKindOfClass:[NSString class]]) {
        return [NSURL URLWithString:value];
    }
    
    return nil;
}


@end
