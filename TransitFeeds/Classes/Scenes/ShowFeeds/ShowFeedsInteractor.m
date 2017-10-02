//
//  ShowFeedsInteractor.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsInteractor.h"

@implementation ShowFeedsInteractor

- (void)getFeeds
{
    [[FeedStore sharedInstance] getFeedsWithCompletion:^(NSArray *feeds, NSError *error) {
        if (error) {
            return;
        }
        [self.presenter presentFeeds:feeds];
    }];
}

@end
