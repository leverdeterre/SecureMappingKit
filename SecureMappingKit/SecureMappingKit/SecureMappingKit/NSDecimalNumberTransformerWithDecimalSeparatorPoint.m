//
//  NSDecimalNumberTransformerWithDecimalSeparatorPoint.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/5/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDecimalNumberTransformerWithDecimalSeparatorPoint.h"

@implementation NSDecimalNumberTransformerWithDecimalSeparatorPoint

//Transforming a Value
- (id)transformedValue:(id)value
{
    if (nil == value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        NSDictionary *dict = [NSDictionary dictionaryWithObject:@"." forKey:NSLocaleDecimalSeparator];
        return [NSDecimalNumber decimalNumberWithString:value locale:dict];
    }
    
    return nil;
}

@end
