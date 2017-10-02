//
//  ShowFeedsInteractor.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TFFoundation/TFFoundation.h>

@protocol ShowFeedsInteractorProtocol

- (void)getFeeds;

@end

@interface ShowFeedsInteractor : NSObject

@end

@implementation ShowFeedsInteractor (ShowFeedsInteractorProtocol)

- (void)getFeeds
{
    [[FeedStore sharedInstance] getFeedsWithCompletion:^(NSArray *feeds, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (Feed *feed in feeds) {
                NSLog(@"%@", feed.name);
            }
        });
    }];
}

@end
