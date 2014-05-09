//
//  NSValueTransformer+WebServiceMapping.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValueTransformer (SecureMappingKit)

+ (Class)transformerClassForExpectedClass:(Class)expectedClass;
+ (instancetype)threadSavedTransformerFromClass:(Class)transformerClass;
+ (instancetype)threadSavedTransformerFromClass:(Class)transformerClass withDateFormat:(NSString *)dateFormat;

@end
