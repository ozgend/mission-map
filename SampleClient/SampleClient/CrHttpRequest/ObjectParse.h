//
//  ObjectParse
//
//  Created by ozgend
//

#import <Foundation/Foundation.h>

@interface ObjectParse : NSObject

+ (id) convertFromJson:(NSString *)response;
+ (id) convertFromObject:(id)object;

@end
