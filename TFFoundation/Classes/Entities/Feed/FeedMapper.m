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
    
    CLLocationCoordinate2D minCoordinate = CLLocationCoordinate2DMake(minLat, minLong);
    CLLocationCoordinate2D maxCoordinate = CLLocationCoordinate2DMake(maxLat, maxLong);
    
    CLLocationCoordinate2D coordinate = [FeedMapper findCenterPoint:minCoordinate :maxCoordinate];
    
    return [[Feed alloc] initWithName:name
                                 city:city
                          countryCode:countryCode
                           coordinate:coordinate];
}

+ (CLLocationCoordinate2D)findCenterPoint:(CLLocationCoordinate2D)_lo1 :(CLLocationCoordinate2D)_loc2 {
    CLLocationCoordinate2D center;
    
    double lon1 = _lo1.longitude * M_PI / 180;
    double lon2 = _loc2.longitude * M_PI / 180;
    
    double lat1 = _lo1.latitude * M_PI / 180;
    double lat2 = _loc2.latitude * M_PI / 180;
    
    double dLon = lon2 - lon1;
    
    double x = cos(lat2) * cos(dLon);
    double y = cos(lat2) * sin(dLon);
    
    double lat3 = atan2( sin(lat1) + sin(lat2), sqrt((cos(lat1) + x) * (cos(lat1) + x) + y * y) );
    double lon3 = lon1 + atan2(y, cos(lat1) + x);
    
    center.latitude  = lat3 * 180 / M_PI;
    center.longitude = lon3 * 180 / M_PI;
    
    return center;
}

@end
