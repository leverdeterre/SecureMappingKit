//
//  NSValueTransformerWithDateFormat.h
//  SecureMappingKit
//
//  Created by Jerome Morissard on 5/8/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValueTransformerWithDateFormat : NSValueTransformer

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end
