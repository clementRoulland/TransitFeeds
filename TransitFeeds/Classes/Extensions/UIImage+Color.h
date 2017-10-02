//
//  UIImage+Color.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-02.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (vImageScaling)

/**
 Return colorized image

 @param color desired color
 @return colored image
 */
- (UIImage *)colorized:(UIColor *)color;

@end
