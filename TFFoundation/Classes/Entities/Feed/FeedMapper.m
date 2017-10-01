//
//  FeedMapper.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "FeedMapper.h"

@implementation FeedMapper

///--------------------------------------
#pragma mark - Metohds
///--------------------------------------

+ (Feed *)mapApiToObject:(NSDictionary *)apiFeed
{
    NSString *name          = apiFeed[@"name"];
    NSString *city          = apiFeed[@"location"];
    NSString *countryCode   = apiFeed[@"country_code"];
    
    if (!(name && city && countryCode)) {
        return nil;
    }
    
    return [[Feed alloc] initWithName: name
                                 city: city
                          countryCode: countryCode];
}

@end
