//
//  YahooWeatherParser.h
//  WeatherSample
//
//  Created by danielzhao on 20/11/12.
//  Copyright (c) 2012 danielzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"

@interface YahooWeatherParser : NSObject<NSXMLParserDelegate> {
    int WOEID;
    WeatherUnit unit;
    
    NSDictionary *astronomyData;
    NSDictionary *conditionData;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate weatherUnit:(WeatherUnit)unit;
- (Weather *)parse;

@end
