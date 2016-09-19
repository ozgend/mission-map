//
//  DestinationsViewController.m
//  MissionMap
//
//  Created by ozgend on 8/18/16.
//  Copyright © 2016 cronom. All rights reserved.
//


#import "DestinationsViewController.h"
#import "MapViewController.h"

@interface DestinationsViewController ()

@property NSMutableArray *destinationArray;
@property MapViewController *mapViewController;
@end

@implementation DestinationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.destinationArray = [[NSMutableArray alloc] init];
    AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
    [self getDestinationList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell new];
    
    if(self.destinationArray.count>0){
        cell.textLabel.text = ((Destination*)[self.destinationArray objectAtIndex:indexPath.row]).Title;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.destinationArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Destination *destination = ((Destination*)[self.destinationArray objectAtIndex:indexPath.row]);
    if(self.mapViewController==nil){
        self.mapViewController = [MapViewController new];
    }
    self.mapViewController.destination = destination;
    
    
    //[[self navigationController] showDetailViewController:self.mapViewController sender:self];
    [self.navigationController presentViewController:self.mapViewController animated:YES completion:nil];
    [self.navigationController showDetailViewController:self.mapViewController sender:self];

}

- (void)getDestinationList{
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:Api_GetAllDestinations parameters:nil error:nil];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            Destination *destination;
            for (NSDictionary *raw in responseObject) {
                destination= [[Destination alloc] initWithDictionary:raw];
                [self.destinationArray addObject: destination];
            }
            [self.table reloadData];
        } else {
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
        }
        
        AFNetworkActivityIndicatorManager.sharedManager.enabled = NO;
    }] resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
