//
//  Weather.h
//  WeatherSample
//
//  Created by danielzhao on 20/11/12.
//  Copyright (c) 2012 danielzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    WeatherUnitCelcius = 0,
    WeatherUnitFahrenheit,
} WeatherUnit;

typedef enum {
    WeatherConditionTornado = 0,
    WeatherConditionTropicalStrom,
    WeatherConditionHurricane,
    WeatherConditionSevereThunderstroms,
    WeatherConditionThunderstorms,
    WeatherConditionMixedRaindAndSnow,
    WeatherConditionMixedRainAndSleet,
    WeatherConditionMixedSnowAndSleet,
    WeatherConditionFexxingDrizzle,
    WeatherConditionDrizzle,
    WeatherConditionFreezingRain,
    WeatherConditionShowers,
    WeatherConditionShowers2,
    WeatherConditionSnowFlurries,
    WeatherConditionLightSnowShowers,
    WeatherConditionBlowingSnow,
    WeatherConditionSnow,
    WeatherConditionHail,
    WeatherConditionSleet,
    WeatherConditionDust,
    WeatherConditionFoggy,
    WeatherConditionHaze,
    WeatherConditionSmoky,
    WeatherConditionBlustery,
    WeatherConditionWindy,
    WeatherConditionCold,
    WeatherConditionCloudy,
    WeatherConditionMostlyCloudyNight,
    WeatherConditionMostlyCloudyDay,
    WeatherConditionPartlyCloudyNight,
    WeatherConditionPartlyCloudyDay,
    WeatherConditionClearNight,
    WeatherConditionSunny,
    WeatherConditionFairNight,
    WeatherConditionFairDay,
    WeatherConditionMixedRainAndHail,
    WeatherConditionHot,
    WeatherConditionIsolatedThunderstorms,
    WeatherConditionScatteredThunderstorms,
    WeatherConditionScatteredThunderstorms2,
    WeatherConditionScatteredShowers,
    WeatherConditionHeavySnow,
    WeatherConditionScatteredSnowShowers,
    WeatherConditionHeavySnow2,
    WeatherConditionPartlyCloudy,
    WeatherConditionThundershowers,
    WeatherConditionSnowShowers,
    WeatherConditionIsolatedThundershowers,
    WeatherConditionNotAvailable,
} WeatherCondition;

@interface Weather : NSObject {
    WeatherCondition condition;
    WeatherUnit unit;
    int temperature;
    NSString *description;
}

@property (nonatomic, assign) WeatherCondition condition;
@property (nonatomic, assign) WeatherUnit unit;
@property (nonatomic, assign) int temperature;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *sunrise;
@property (nonatomic, retain) NSString *sunset;

- (NSString *)weathImageName;

@end
