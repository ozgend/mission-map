//
//  Location.h
//  MissionMap
//
//  Created by ozgend on 9/19/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Destination : NSObject

@property NSString *Address;
@property NSString *Title;
@property double Lat;
@property double Lon;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
