//
//  ViewController.h
//  MissionMap
//
//  Created by ozgend on 8/18/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Destination.h"

@interface MapViewController : UIViewController

@property Destination *destination;
//@property IBOutlet UIView *mapView;
@property IBOutlet UINavigationBar *navigationBar;

-  (IBAction) close:(id) sender;


-(void)loadMapForDestination;

@end

