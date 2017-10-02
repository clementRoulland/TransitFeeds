//
//  UIImage+Color.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-02.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (vImageScaling)

- (UIImage *)colorized:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, rect, self.CGImage);
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return coloredImage;
}

@end
