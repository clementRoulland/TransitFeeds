//
//  UIColor+NSString.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-02.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NSString)

/**
 Create UIColor from hex

 @param hexString hex code of color (#ffffff)
 @return generated color
 */
+ (UIColor *)fromHex:(NSString *)hexString;

@end
