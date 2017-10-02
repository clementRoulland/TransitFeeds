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

@implementation ShowFeedsPresenter

- (void)presentFeeds:(NSArray *)feeds
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

- (UIColor *)colorForCountryCode:(NSString *)countryCode {
    if ([countryCode isEqualToString:@"CA"]) {
        return [self colorFromHex:@"#f44336"];
    }
    else if ([countryCode isEqualToString:@"US"]) {
        return [self colorFromHex:@"#e040fb"];
    }
    else if ([countryCode isEqualToString:@"FR"]) {
        return [self colorFromHex:@"#3f51b5"];
    }
    else if ([countryCode isEqualToString:@"DE"]) {
        return [self colorFromHex:@"#ffc107"];
    }
    else if ([countryCode isEqualToString:@"GB"]) {
        return [self colorFromHex:@"#8bc34a"];
    }
    else {
        return [self colorFromHex:@"#00bcd4"];
    }
}

- (UIColor *)colorFromHex:(NSString *)hexString {
    if(hexString == nil || [hexString isEqualToString:@""]) return nil;
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
