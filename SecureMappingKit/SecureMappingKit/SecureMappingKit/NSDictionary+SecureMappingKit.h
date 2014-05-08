//
//  NSDictionary+SecureMappingKit.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

//Transformer Classes
#import "NSStringTransformer.h"
#import "NSNumberTransformer.h"
#import "NSBooleanNumberTransformer.h"
#import "NSArrayTransformer.h"
#import "NSURLTransformer.h"
#import "NSDecimalNumberTransformer.h"
#import "NSDecimalNumberTransformerWithDecimalSeparatorComa.h"
#import "NSDecimalNumberTransformerWithDecimalSeparatorPoint.h"
#import "NSDateTransformer.h"

typedef id (^JMOTransformerBlock)(id value);

@interface NSDictionary (SecureMappingKit)

/**
 *  Description get objet for key using basic classes.
 *
 *  @param aKey          A key
 *  @param expectedClass The exepected class in output of the tranform.
 *
 *  @return id
 */
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass;


/**
 *  Description get objet for key using basic classes.
 *
 *  @param aKey          A key
 *  @param expectedClass The exepected class in output of the tranform.
 *  @param transformerClass Class if you want a special behavior (for example boolean has NSNumber)
 *
 *  @return id
 */
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass withTransformerClass:(Class)transformerClass;

/**
 *  Description get objet for key using basic classes.
 *
 *  @param aKey          A key
 *  @param transformerBlock The block you want to use to make the transform
 *
 *  @return id
 */
- (id)objectForKey:(id)aKey withTransformerBlock:(JMOTransformerBlock)transformerBlock;

/*
 OPTIONS
@interface NSDateFormatter (SecureMappingKit)
+ (void)setForcedTimeZone:(NSTimeZone *)forcedTimeZone;
+ (void)setForcedlocale:(NSLocale *)forcedLocale;
 */

- (NSNumber *)numberForKey:(id)aKey;
- (NSNumber *)boolNumberForKey:(id)aKey;
- (NSDecimalNumber *)decimalNumberForKey:(id)aKey;
- (NSString *)stringForKey:(id)aKey;
- (NSURL *)urlForKey:(id)aKey;
- (NSArray *)arrayForKey:(id)aKey;
- (NSDate *)dateForKey:(id)aKey withDateFormat:(NSString *)dateFormat;

@end
