//
//  NSValueTransformer+WebServiceMapping.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValueTransformer (SecureMappingKit)

+ (instancetype)transformerForClass:(Class)transformerClass;

@end
