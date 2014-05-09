//
//  SecureMappingKit.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

//Categories
#import "NSDictionary+SecureMappingKit.h"
#import "NSValueTransformer+SecureMappingKit.h"
#import "NSDateFormatter+SecureMappingKit.h"
#import "NSDate+SecureMappingKit.h"
#import "NSObject+SecureMappingKit.h"

//Protocols
#import "SecureDecoding.h"

@interface SecureMappingKit : NSObject

+ (void)setDateFormatterForcedTimeZone:(NSTimeZone *)forcedTimeZone;
+ (void)setDateFormatterForcedlocale:(NSLocale *)forcedLocale;
+ (void)setLogEnable:(BOOL)logEnable;

@end
