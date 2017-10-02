//
//  FeedMapper.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "FeedMapper.h"
#import <CoreLocation/CoreLocation.h>

@implementation FeedMapper

///--------------------------------------
#pragma mark - Metohds
///--------------------------------------

+ (Feed *)mapApiToObject:(NSDictionary *)apiFeed
{
    NSString *name          = apiFeed[@"name"];
    NSString *city          = apiFeed[@"location"];
    NSString *countryCode   = apiFeed[@"country_code"];
    NSDictionary *bounds    = apiFeed[@"bounds"];
    
    if (!(name && city && countryCode && bounds)) {
        return nil;
    }
    
    double minLat   = ((NSNumber*)bounds[@"min_lat"]).doubleValue;
    double maxLat   = ((NSNumber*)bounds[@"max_lat"]).doubleValue;
    double minLong  = ((NSNumber*)bounds[@"min_lon"]).doubleValue;
    double maxLong  = ((NSNumber*)bounds[@"max_lon"]).doubleValue;
    
    if (!(minLat && maxLat && minLong && maxLong)) {
        return nil;
    }
    
    double latitude     = minLat + maxLat - minLat;
    double longitude    = minLong + maxLong - minLong;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    return [[Feed alloc] initWithName:name
                                 city:city
                          countryCode:countryCode
                           coordinate:coordinate];
}

@end
