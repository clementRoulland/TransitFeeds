//
//  UIColor+NSString.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-02.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "UIColor+NSString.h"

@implementation UIColor (NSString)

+ (UIColor *)fromHex:(NSString *)hexString {
    if(hexString == nil || [hexString isEqualToString:@""]) return nil;
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
