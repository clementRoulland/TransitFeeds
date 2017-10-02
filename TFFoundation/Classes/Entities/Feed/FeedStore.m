//
//  FeedStore.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "FeedStore.h"
#import "FeedAPIClient.h"

@implementation FeedStore

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedInstance
{
    static FeedStore *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[FeedStore alloc] init];
    });
    return _sharedInstance;
}

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion
{
    [[FeedAPIClient sharedInstance] getFeedsWithCompletion:completion];
}

@end
