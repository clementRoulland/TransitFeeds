//
//  FeedAPIClient.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFAPIClient.h"

@protocol FeedAPIClientProtocol

/**
 Get feeds
 
 @param completion Block with feeds and error
 */
- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion;

@end

@interface FeedAPIClient : TFAPIClient <FeedAPIClientProtocol>

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedInstance;

///--------------------------------------
#pragma mark - Metohds
///--------------------------------------

- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion;

@end
