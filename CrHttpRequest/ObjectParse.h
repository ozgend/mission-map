//
//  ObjectParse
//
//  Created by ozgend
//

#import <Foundation/Foundation.h>

@interface ObjectParse : NSObject

+ (id) objectForJsonData:(NSData *)response;
+ (id) objectForJsonString:(NSString *)response;
+ (NSData*) dataForObject:(id)object;
+ (id) dictionaryForObject:(id)object;

@end
