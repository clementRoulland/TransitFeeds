//
//  ShowFeedsModels.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsModels.h"

@implementation ShowFeedsAnnotation

- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                   coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _title = title;
        _subtitle = subtitle;
        _coordinate = coordinate;
    }
    return self;
}

@end
