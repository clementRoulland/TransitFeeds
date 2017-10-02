//
//  FeedStore.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"

///--------------------------------------
#pragma mark - FeedStoreProtocol
///--------------------------------------

@protocol FeedStoreProtocol

/**
 Get feeds
 
 @param completion Block with feeds and error
 */
- (void)getFeedsWithCompletion:(void (^)(NSArray<Feed *> *feeds, NSError *error))completion;

@end

///--------------------------------------
#pragma mark - FeedStore
///--------------------------------------

@interface FeedStore : NSObject <FeedStoreProtocol>

+ (NSObject<FeedStoreProtocol> *)sharedInstance;

@end
