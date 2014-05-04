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
- [ ] NSDateTransformer

#How To

## Get SecureMappingKit (Soon)

If you use Cocoa Pods, you can get SecureMappingKit by adding to your podfile `pod 'SecureMappingKit', '~>0.0.x'`. 

##Using SecureMappingKit

1. Import the file `#import "NSDictionary+SecureMappingKit.h"`
2. Call the new ojectForKey methods
```objective-c
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass;
- (id)objectForKey:(id)aKey expectedClass:(Class)expectedClass withTransformerClass:(Class)transformerClass;
- (id)objectForKey:(id)aKey withTransformerBlock:(JMOTransformerBlock)transformerBlock;
```

Example : 
```objective-c
- (void)setupWithDictionary:(NSDictionary *)dict
{
    self.identifier = [dict objectForKey:@"id" 
                            expectedClass:NSString.class];

    self.isActive = [[dict objectForKey:@"isActive" 
                           expectedClass:NSNumber.class 
                          withTransformerClass:NSBooleanNumberTransformer.class] boolValue];
                          
    self.balance = [[dict objectForKey:@"balance" 
                          expectedClass:NSNumber.class] floatValue];
}

```
