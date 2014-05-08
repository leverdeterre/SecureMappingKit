//
//  NSStringTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSStringTransformer.h"

@implementation NSStringTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
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
    
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSDate class]]) {
        if (self.dateFormatter) {
            return [self.dateFormatter stringFromDate:value];
        }
    }
    
    if ([value isKindOfClass:[NSObject class]]) {
        return [NSString stringWithFormat:@"%@",value];
    }
    
    return nil;
}

@end
