//
//  Feed.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "Feed.h"

@implementation Feed

///--------------------------------------
#pragma mark - Init
///--------------------------------------

- (instancetype)initWithName:(NSString *)name
                        city:(NSString *)city
                 countryCode:(NSString *)countryCode
                  coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _name           = name;
        _city           = city;
        _countryCode    = countryCode;
        _coordinate     = coordinate;
    }
    return self;
}
@end
