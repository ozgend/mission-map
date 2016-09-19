//
//  DestinationsViewController.h
//  MissionMap
//
//  Created by ozgend on 8/18/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "Common.h"
#import "Destination.h"


@interface DestinationsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property IBOutlet UITableView *table;

@end
