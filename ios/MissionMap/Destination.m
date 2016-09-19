//
//  Location.m
//  MissionMap
//
//  Created by ozgend on 9/19/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import "Destination.h"

@implementation Destination

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.Address = dictionary[@"Address"];
        self.Title = dictionary[@"Title"];
        self.Lat = [dictionary[@"Lat"] doubleValue];
        self.Lon = [dictionary[@"Lon"] doubleValue];
    }
    return self;
}

@end
