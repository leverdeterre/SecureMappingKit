//
//  NSDecimalNumberTransformer.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/5/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDecimalNumberTransformer.h"
#import "NSDecimalNumberTransformerWithDecimalSeparatorComa.h"
#import "NSDecimalNumberTransformerWithDecimalSeparatorPoint.h"

@implementation NSDecimalNumberTransformer

+ (Class)transformedValueClass
{
    return [NSDecimalNumber class];
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
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value rangeOfString:@"."].location != NSNotFound) {
            NSDictionary *dict = [NSDictionary dictionaryWithObject:@"." forKey:NSLocaleDecimalSeparator];
            return [NSDecimalNumber decimalNumberWithString:value locale:dict];
        } else if ([value rangeOfString:@","].location != NSNotFound) {
            NSDictionary *dict = [NSDictionary dictionaryWithObject:@"," forKey:NSLocaleDecimalSeparator];
            return [NSDecimalNumber decimalNumberWithString:value locale:dict];
        } else {
            return [NSDecimalNumber decimalNumberWithString:value];
        }
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
    }
    
    return nil;
}

@end
