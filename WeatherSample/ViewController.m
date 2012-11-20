//
//  ViewController.m
//  WeatherSample
//
//  Created by danielzhao on 20/11/12.
//  Copyright (c) 2012 danielzhao. All rights reserved.
//

#import "ViewController.h"
#import "YahooWeatherParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    YahooWeatherParser *yahooWeatherParser = [[YahooWeatherParser alloc] initWithCoordinate:CLLocationCoordinate2DMake(1.303140, 103.85719) weatherUnit:WeatherUnitCelcius];
    
    Weather *weather = [yahooWeatherParser parse];
    
    NSLog(@"condition: %d",weather.condition);
    
    UIImageView *weatherImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[weather weathImageName]]];
    weatherImageView.frame = CGRectMake(0, 0, 177, 136);
    [self.view addSubview:weatherImageView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
