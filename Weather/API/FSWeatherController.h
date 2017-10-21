//
//  FSWeatherController.h
//  Weather
//
//  Created by Nathan Furman on 10/21/17.
//  Copyright © 2017 Nathan Furman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FSWeatherInfo;
@protocol FSWeatherControllerDelegate;

@interface FSWeatherController : NSObject

@property(nonatomic, weak) id <FSWeatherControllerDelegate> delegate;

-(void)start;

@end

@protocol FSWeatherControllerDelegate <NSObject>

-(void)weatherControllerDidRetrieveInfo:(FSWeatherInfo *) info;
-(void)weatherControllerDidFailWithError:(NSError *) error;

@optional

@end

