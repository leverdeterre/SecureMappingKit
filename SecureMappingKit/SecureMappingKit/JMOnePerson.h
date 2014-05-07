//
//  JMOnePerson.h
//  webserviceMapping
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecureDecoding.h"

@interface JMOnePerson : NSObject <SecureDecoding>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *guid;
@property (assign, nonatomic) BOOL isActive;
@property (assign, nonatomic) float balance;
@property (strong, nonatomic) NSDecimalNumber* balanceDecimalNumber;
@property (strong, nonatomic) NSDate *birthDate;
@end