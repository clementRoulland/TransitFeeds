//
//  ShowFeedsPresenter.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsPresenter.h"

@implementation ShowFeedsPresenter

- (void)presentFeeds:(NSArray *)feeds
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController displayPins];
    });
}

@end
