//
//  ShowFeedsModels.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsModels.h"

///--------------------------------------
#pragma mark - ShowFeedsAnnotation
///--------------------------------------

@implementation ShowFeedsAnnotation

@synthesize title       = _title;
@synthesize subtitle    = _subtitle;
@synthesize coordinate  = _coordinate;
@synthesize pinColor    = _pinColor;

#pragma mark Initializers

- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                   coordinate:(CLLocationCoordinate2D)coordinate
                     pinColor:(UIColor *)pinColor
{
    self = [super init];
    if (self) {
        _title      = title;
        _subtitle   = subtitle;
        _coordinate = coordinate;
        _pinColor   = pinColor;
    }
    return self;
}

@end
