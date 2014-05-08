//
//  SecureMappingKit.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "SecureMappingKit.h"
#import "NSDateFormatter+SecureMappingKit.h"

@implementation SecureMappingKit

+ (void)setDateFormatterForcedTimeZone:(NSTimeZone *)forcedTimeZone
{
    [NSDateFormatter setForcedTimeZone:forcedTimeZone];
}

+ (void)setDateFormatterForcedlocale:(NSLocale *)forcedLocale
{
    [NSDateFormatter setForcedlocale:forcedLocale];
}

+ (void)setLogEnable:(BOOL)logEnable
{
    
}

@end
