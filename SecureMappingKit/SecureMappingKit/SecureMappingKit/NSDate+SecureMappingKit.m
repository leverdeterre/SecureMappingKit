//
//  NSDate+SecureMappingKit.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSDate+SecureMappingKit.h"
#import "NSValueTransformer+SecureMappingKit.h"
#import "NSStringTransformer.h"

@implementation NSDate (SecureMappingKit)

- (NSString *)stringWithDateFormat:(NSString *)dateFormat
{
    NSStringTransformer *transformer = [NSStringTransformer transformerForClass:NSStringTransformer.class withDateFormat:dateFormat];
    return [transformer transformedValue:self];
}

@end
