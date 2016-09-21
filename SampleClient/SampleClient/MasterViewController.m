//
//  MasterViewController.m
//  SampleClient
//
//  Created by ozgend on 9/21/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Customer.h"

@interface MasterViewController ()

@property NSMutableArray *customers;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    //https://api.myjson.com/bins/4f2vg
    
    CrHttpRequest* request = [[CrHttpRequest alloc] initWithDelegate:self];
    [request makeRequest:@"https://api.myjson.com/bins/4f2vg"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *customer = self.customers[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:customer];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *item = self.customers[indexPath.row];
    Customer* customer = [[Customer alloc] init];
    [customer setValuesForKeysWithDictionary:item];
    
    cell.textLabel.text = customer.Title;
    return cell;
}

- (void)crHttpRequestCompleted:(id)responseObject{
    self.customers = responseObject;
}

- (void)crHttpRequestFailed:(NSError *)error{
    
}

@end
