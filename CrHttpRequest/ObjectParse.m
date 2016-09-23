//
//  ObjectParse
//
//  Created by ozgend
//

#import "ObjectParse.h"
#import "SBJson.h"
#import <objc/runtime.h>

@implementation ObjectParse

+ (id)objectForJsonData:(NSData *)jsonData{
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}

+ (id) objectForJsonString:(NSString *)jsonString
{
    //SBJsonParser *parser = [[SBJsonParser alloc] init];
    //id result = [parser objectWithString:response];
    //return result;
   
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [self objectForJsonData:jsonData];
}

+ (NSData *)dataForObject:(id)object{
    id temp = [self dictionaryForObject:object];
    return [NSJSONSerialization dataWithJSONObject:temp options:0 error:nil];
}

+ (id) dictionaryForObject:(id)object{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    id YourClass = [object class];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(YourClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        SEL propertySelector = NSSelectorFromString(propertyName);
        if ([object respondsToSelector:propertySelector]) {
            [dict setValue:[object performSelector:propertySelector] forKey:propertyName];
        }
    }
    
    return dict;
}



@end
