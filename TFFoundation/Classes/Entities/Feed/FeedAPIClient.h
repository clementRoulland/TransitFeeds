//
//  FeedAPIClient.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFAPIClient.h"
#import "Feed.h"

///--------------------------------------
#pragma mark - FeedAPIClientProtocol
///--------------------------------------

@protocol FeedAPIClientProtocol

/**
 Get feeds
 
 @param completion Block with feeds and error
 */
- (void)getFeedsWithCompletion:(void (^)(NSArray<Feed *> *feeds, NSError *error))completion;

@end

///--------------------------------------
#pragma mark - FeedAPIClient
///--------------------------------------

@interface FeedAPIClient : TFAPIClient <FeedAPIClientProtocol>

+ (NSObject<FeedAPIClientProtocol> *)sharedInstance;

@end
