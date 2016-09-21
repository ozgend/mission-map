//
//  DataHelper
//
//  Created by ozgend
//

#import "DataHelper.h"

@implementation DataHelper

+ (void)persistKey:(NSString *)key withValue:(NSString *)value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults setObject:value forKey:key];
        NSLog(@"persistKey %@ - %@",key,value);
        [defaults synchronize];
    }
}

+ (NSString *)loadKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *value = nil;
    if(defaults){
        value = [defaults objectForKey:key];
        NSLog(@"loadKey %@ - %@",key, value);
    }
    else{
        NSLog(@"loadKey defaults nil");
    }
    return  value;
}

@end
