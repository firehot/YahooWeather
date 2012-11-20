//
//  YahooWeatherParser.m
//  WeatherSample
//
//  Created by danielzhao on 20/11/12.
//  Copyright (c) 2012 danielzhao. All rights reserved.
//

#import "YahooWeatherParser.h"
#import "JSONKit.h"

#define kYahooWeatherXMLKeyAstronomyTag   @"yweather:astronomy"
#define kYahooWeatherXMLKeySunrise        @"sunrise"
#define kYahooWeatherXMLKeySunset         @"sunset"

#define kYahooWeatherXMLKeyConditionTag   @"yweather:condition"
#define kYahooWeatherXMLKeyTemp           @"temp"
#define kYahooWeatherXMLKeyText           @"text"
#define kYahooWeatherXMLKeyCondition      @"code"

#define kYahooWeatherJSONKeyResultSet     @"ResultSet"
#define kYahooWeatherJSONKeyResults       @"Results"
#define kYahooWeatherJSONKeyWoeid         @"woeid"

@implementation YahooWeatherParser

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate weatherUnit:(WeatherUnit)unit{

    if ((self = [super init])) {
        
        unit = WeatherUnitCelcius;
        
        NSString *urlStr = [NSString stringWithFormat:@"http://where.yahooapis.com/geocode?location=%f,%f&flags=J&gflags=R&appid=zHgnBS4m",coordinate.latitude,coordinate.longitude];
        
        NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr] encoding:NSUTF8StringEncoding error:nil];
        
        
        NSDictionary *dic = [content objectFromJSONString];
        
        NSLog(@"dic: %@",dic);
        
        WOEID = [[[[[dic objectForKey:kYahooWeatherJSONKeyResultSet] objectForKey:kYahooWeatherJSONKeyResults] objectAtIndex:0] objectForKey:kYahooWeatherJSONKeyWoeid] integerValue];

        NSLog(@"%d",WOEID);
        
    }
    
    
    return self;
}

- (Weather *)parse {
    NSURL *URL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?w=%d&u=%@", WOEID, (unit == WeatherUnitCelcius) ? @"c" : @"f"]];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
    [xmlParser setDelegate:self];
    
    Weather *weather = nil;
    if([xmlParser parse]) {
        weather = [[Weather alloc] init];
        weather.description = [conditionData objectForKey:kYahooWeatherXMLKeyText];
        weather.temperature = [[conditionData objectForKey:kYahooWeatherXMLKeyTemp] intValue];
        weather.condition = [[conditionData objectForKey:kYahooWeatherXMLKeyCondition] intValue];
        weather.sunrise = [astronomyData objectForKey:kYahooWeatherXMLKeySunrise];
        weather.sunset = [astronomyData objectForKey:kYahooWeatherXMLKeySunset];
    }
    
    return weather;
}


#pragma mark -
#pragma mark NSXMLParser delegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    if([elementName isEqualToString:kYahooWeatherXMLKeyConditionTag]) {
        
        conditionData = attributeDict;
    }else if([elementName isEqualToString:kYahooWeatherXMLKeyAstronomyTag]){
    
        astronomyData = attributeDict;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName {
}


@end
