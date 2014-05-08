//
//  JMOnePerson.m
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOnePerson.h"
#import "NSDictionary+SecureMappingKit.h"

@implementation JMOnePerson

-(void)decodeObjectWithDictionary:(NSDictionary *)dict
{
    self.identifier = [dict objectForKey:@"id" expectedClass:NSString.class];
    
    self.isActive = [[dict objectForKey:@"isActive"
                          expectedClass:NSNumber.class
                   withTransformerClass:NSBooleanNumberTransformer.class] boolValue];
    
    self.balance = [[dict objectForKey:@"balance" expectedClass:NSNumber.class] floatValue];
    
    self.balanceDecimalNumber = [dict objectForKey:@"balance" expectedClass:NSDecimalNumber.class];
    
    self.birthDate =  [dict dateForKey:@"birthDate" withDateFormat:@"MM/dd/yyyy"];
}

@end
