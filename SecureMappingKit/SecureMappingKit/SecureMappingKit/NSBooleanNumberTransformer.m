//
//  NSBooleanNumberTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSBooleanNumberTransformer.h"

@implementation NSBooleanNumberTransformer

- (id)transformedValue:(id)value
{
    if (nil == value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"false"]) {
            return @NO;
        } else if ([value isEqualToString:@"true"]) {
            return @YES;
        }
    }
    
    if ([value respondsToSelector:@selector(floatValue)]) {
        return [NSNumber numberWithFloat:[value floatValue]];
    }
    
    return nil;
}

@end
