//
//  NSDateTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/6/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDateTransformer.h"

@implementation NSDateTransformer

+ (Class)transformedValueClass
{
    return [NSDate class];
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
    
    if ([value isKindOfClass:[NSDate class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        return [self.dateFormatter dateFromString:value];
    }
    
    return nil;
}

@end
