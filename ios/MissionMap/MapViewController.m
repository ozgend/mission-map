//
//  ViewController.m
//  MissionMap
//
//  Created by ozgend on 8/18/16.
//  Copyright © 2016 cronom. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

GMSMapView *mapView;

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMapForDestination];
}

- (void)close:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)loadMapForDestination {
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.destination.Lat longitude:self.destination.Lon zoom:12];
    
    //mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera ];
    
    CGRect frame = self.view.frame;
    CGRect mapFrame = CGRectMake(frame.origin.x, 44*2, frame.size.width, frame.size.height);
    mapView = [GMSMapView mapWithFrame:mapFrame camera:camera];
    mapView.myLocationEnabled = YES;
    
    [self.view addSubview:mapView];
    
    if(self.destination==nil){
        return;
    }
    
    GMSMarker *marker = [GMSMarker new];
    marker.position = CLLocationCoordinate2DMake(self.destination.Lat,self.destination.Lon);
    marker.title = self.destination.Title;
    marker.snippet = self.destination.Address;
    marker.map = mapView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
