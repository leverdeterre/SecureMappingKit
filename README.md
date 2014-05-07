SecureMappingKit 
==============================
Securize your mapping between your JSON and your object.
What is security ? The library make effort to convert the JSON class your the desired class. 
If your are expected a NSString and the JSON gives you a NSNumber, SecureMappingKit transforms it into the exepected class, using NSValueTransformer.

Actual tranformers : 
- [x] NSNumberTransformer,
- [x] NSBooleanNumberTransformer, to be sure to have a NSNumber of a boolean 
- [x] NSStringTransformer,
- [x] NSURLTransformer,
- [x] NSArrayTransformer,
- [x] NSDateTransformer,
- [x] NSDecimalTransformer

#How To

## Get SecureMappingKit (Soon)

If you use Cocoa Pods, you can get SecureMappingKit by adding to your podfile `pod 'SecureMappingKit', '~>0.0.x'`. 

##Using SecureMappingKit

Call the new ojectForKey: methods

```objective-c
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass;
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass withTransformerClass:(Class)transformerClass;
- (id)objectForKey:(id)aKey withTransformerBlock:(JMOTransformerBlock)transformerBlock;

- (NSDate *)dateObjectForKey:(id)aKey withDateFormat:(NSString *)dateFromat;
```

Configure optional values
```objective-c
    [NSDateFormatter setForcedlocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
    [NSDateFormatter setForcedTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
```


Examples : 
```objective-c
- (void)setupWithDictionary:(NSDictionary *)dict
{
    NSString *identifier = [dict objectForKey:@"id" expectedClass:NSString.class];

    BOOL isActive = [[dict  objectForKey:@"isActive" 
                            expectedClass:NSNumber.class 
                            withTransformerClass:NSBooleanNumberTransformer.class] boolValue];
                          
    float balance = [[dict objectForKey:@"balance" expectedClass:NSNumber.class] floatValue];
    
    //@{@"url":@"http://www.google.fr"}
    NSURL *url = [dict  objectForKey:@"url" expectedClass:NSURL.class];
    
    NSDate *date = [dict  dateObjectForKey:@"date" withDateFormat:@"MM/dd/yyyy"];
}

```
