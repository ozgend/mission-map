//
//  DetailViewController.h
//  SampleClient
//
//  Created by ozgend on 9/21/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

