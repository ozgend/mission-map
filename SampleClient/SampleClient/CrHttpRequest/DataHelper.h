//
//  DataHelper
//
//  Created by ozgend
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject

+ (void) persistKey:(NSString*)key withValue:(NSString*)value;
+ (NSString*) loadKey:(NSString*)key;

@end
