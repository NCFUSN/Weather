//
//  FSWeatherController.m
//  Weather
//
//  Created by Nathan Furman on 10/21/17.
//  Copyright © 2017 Nathan Furman. All rights reserved.
//

#import "FSWeatherController.h"
@import CoreLocation;
#import "FSWeatherInfo.h"

@interface FSWeatherController () <CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager * locationManger;
@end

@implementation FSWeatherController 

-(void)start {
    
    self.locationManger = [[CLLocationManager alloc] init];
    self.locationManger.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManger respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManger requestWhenInUseAuthorization];
    }
    _locationManger.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    [self.locationManger startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.lastObject;
    FSWeatherInfo *weatherInfo = [[FSWeatherInfo alloc]init];
    weatherInfo.latitude = location.coordinate.latitude;
    weatherInfo.longitude = location.coordinate.longitude;
    weatherInfo.timeStamp = location.timestamp;
    
    if([self.delegate respondsToSelector:@selector(weatherControllerDidRetrieveInfo:)]) {
        
        [self.delegate weatherControllerDidRetrieveInfo:weatherInfo];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    //print error
}
@end
