//
//  NSValueTransformer+WebServiceMapping.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "NSValueTransformer+SecureMappingKit.h"

@implementation NSValueTransformer (SecureMappingKit)

+ (instancetype)transformerForClass:(Class)transformerClass
{
    NSDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSValueTransformer *transformer = [threadDict objectForKey:NSStringFromClass(transformerClass)];
    
    if (nil == transformer) {
        transformer = [transformerClass new];
        [threadDict setValue:transformer forKey:NSStringFromClass(transformerClass)];
    }
    
    return transformer;
}

@end
