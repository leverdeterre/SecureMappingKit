//
//  JMOnePerson.h
//  webserviceMapping
//
//  Created by Jerome Morissard on 5/4/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMOnePerson : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *guid;
@property (assign, nonatomic) BOOL isActive;
@property (assign, nonatomic) float balance;

- (void)setupWithDictionary:(NSDictionary *)dict;

@end