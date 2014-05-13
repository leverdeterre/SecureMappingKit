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
        NSString *stringVal = value;
        NSMutableDictionary *dict = [NSMutableDictionary new];
        if ([stringVal rangeOfString:@"."].location != NSNotFound) {
            [dict setValue:@"." forKey:NSLocaleDecimalSeparator];
        } else if ([stringVal rangeOfString:@","].location != NSNotFound) {
            [dict setValue:@"," forKey:NSLocaleDecimalSeparator];
        }
        
        if ([stringVal rangeOfString:@" "].location != NSNotFound) {
            stringVal = [stringVal stringByReplacingOccurrencesOfString:@" " withString:@""];
            //[dict setValue:@" " forKey:NSLocaleGroupingSeparator];
        }
        self.locale = dict;
        return [NSDecimalNumber decimalNumberWithString:stringVal locale:self.locale];
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
    }
    
    return nil;
}

@end
