//
//  FSWeatherInfo.h
//  Weather
//
//  Created by Nathan Furman on 10/21/17.
//  Copyright © 2017 Nathan Furman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSWeatherInfo : NSObject
@property(nonatomic, strong) NSString *celcium;
@property(nonatomic, strong) NSString *farenheit;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *country;
@property(nonatomic, assign) float latitude;
@property(nonatomic, assign) float longitude;
@property(nonatomic, strong) NSDate *timeStamp;

@end
