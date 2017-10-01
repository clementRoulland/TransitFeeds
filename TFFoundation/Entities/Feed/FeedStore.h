//
//  FeedStore.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedStoreProtocol

/**
 Get feeds
 
 @param completion Block with feeds and error
 */
- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion;


/**
 Get feeds by country

 @param completion Block with feeds by country and error
 */
- (void)getFeedsByCountryWithCompletion:(void (^)(NSDictionary *feedsByCountry, NSError *error))completion;

@end

@interface FeedStore : NSObject <FeedStoreProtocol>

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedInstance;

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion;
- (void)getFeedsByCountryWithCompletion:(void (^)(NSDictionary *feedsByCountry, NSError *error))completion;

@end
