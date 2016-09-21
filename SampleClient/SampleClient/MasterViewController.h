//
//  MasterViewController.h
//  SampleClient
//
//  Created by ozgend on 9/21/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrHttpRequest.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <CrHttpRequestCallback>

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

