//
//  FSMainViewController.m
//  Weather
//
//  Created by Nathan Furman on 10/21/17.
//  Copyright © 2017 Nathan Furman. All rights reserved.
//

#import "FSMainViewController.h"
#import "FSWeatherController.h"
#import "FSWeatherInfo.h"

@interface FSMainViewController ()<FSWeatherControllerDelegate>

@property(nonatomic, strong) FSWeatherController *weatherController;

@end

@implementation FSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _weatherController = [[FSWeatherController alloc]init];
    _weatherController.delegate = self;
    [_weatherController start];
}

#pragma mark - FSWeatherControllerDelegate

-(void)weatherControllerDidRetrieveInfo:(FSWeatherInfo *)info {
    
    NSLog(@"%@", info);
}

-(void)weatherControllerDidFailWithError:(NSError *)error {
    
    NSLog(@"%@", error.localizedDescription);
}

@end
