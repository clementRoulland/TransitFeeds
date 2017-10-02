//
//  ShowFeedsPresenter.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsPresenter.h"
#import <TFFoundation/TFFoundation.h>
#import "ShowFeedsModels.h"
#import "UIColor+NSString.h"

///--------------------------------------
#pragma mark - ShowFeedsPresenter
///--------------------------------------

@implementation ShowFeedsPresenter

#pragma mark Public methods

- (void)presentFeeds:(NSArray<Feed *> *)feeds
{
    NSMutableArray *annotations = [@[] mutableCopy];
    for (Feed *feed in feeds) {
        UIColor *pinColor = [self colorForCountryCode:feed.countryCode];
        
        ShowFeedsAnnotation *annotation = [[ShowFeedsAnnotation alloc] initWithTitle:feed.name
                                                                            subtitle:feed.city
                                                                          coordinate:feed.coordinate
                                                                            pinColor:pinColor];
        [annotations addObject:annotation];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController displayAnnotations:annotations];
    });
}

#pragma mark Private methods

- (UIColor *)colorForCountryCode:(NSString *)countryCode {
    if ([countryCode isEqualToString:@"CA"]) {
        return [UIColor fromHex:@"#f44336"];
    }
    else if ([countryCode isEqualToString:@"US"]) {
        return [UIColor fromHex:@"#e040fb"];
    }
    else if ([countryCode isEqualToString:@"FR"]) {
        return [UIColor fromHex:@"#3f51b5"];
    }
    else if ([countryCode isEqualToString:@"DE"]) {
        return [UIColor fromHex:@"#ffc107"];
    }
    else if ([countryCode isEqualToString:@"GB"]) {
        return [UIColor fromHex:@"#8bc34a"];
    }
    else {
        return [UIColor fromHex:@"#00bcd4"];
    }
}


@end
