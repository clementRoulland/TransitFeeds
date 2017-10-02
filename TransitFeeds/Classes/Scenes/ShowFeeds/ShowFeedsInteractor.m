//
//  ShowFeedsInteractor.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsInteractor.h"

@implementation ShowFeedsInteractor

#pragma mark - ShowFeedsInteractorProtocol implementation

- (void)getFeeds
{
    [[FeedStore sharedInstance] getFeedsWithCompletion:^(NSArray<Feed *> *feeds, NSError *error) {
        if (error) {
            return;
        }
        [self.presenter presentFeeds:feeds];
    }];
}

@end
