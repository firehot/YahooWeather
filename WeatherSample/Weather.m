//
//  Weather.m
//  WeatherSample
//
//  Created by danielzhao on 20/11/12.
//  Copyright (c) 2012 danielzhao. All rights reserved.
//

#import "Weather.h"

@implementation Weather

@synthesize condition, unit, temperature, description,sunrise,sunset;

- (NSString *)weathImageName{

    NSString *weathImageName = @"";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];

    NSLog(@"%@",dateStr);
    
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    
    NSDate *sunriseDate = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@",dateStr,self.sunrise]];
    NSDate *sunsetDate = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@",dateStr,self.sunset]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    
    NSLog(@"sunriseDate: %@",[formatter stringFromDate:sunriseDate]);
    NSLog(@"sunsetDate: %@",[formatter stringFromDate:sunsetDate]);
    NSLog(@"%@",[formatter stringFromDate:[NSDate date]]);

    NSLog(@"%d",[sunriseDate compare:[NSDate date]]);
    NSLog(@"%d",[sunsetDate compare:[NSDate date]]);

    if ([sunriseDate compare:[NSDate date]] == NSOrderedAscending && [sunsetDate compare:[NSDate date]] == NSOrderedDescending) {
        weathImageName = [NSString stringWithFormat:@"%dd",condition];
    }
    else{
        weathImageName = [NSString stringWithFormat:@"%dn",condition];
    }
    NSLog(@"we: %@",weathImageName);
    return weathImageName;
    
}

@end
