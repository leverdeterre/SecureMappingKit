//
//  SecureDecoding.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/7/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SecureDecoding <NSObject>

-(void)decodeObjectWithDictionary:(NSDictionary *)dictionary;

@end
