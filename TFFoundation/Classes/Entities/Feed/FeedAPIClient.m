//
//  FeedAPIClient.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "FeedAPIClient.h"
#import "Constants.h"
#import "Feed.h"
#import "FeedMapper.h"

@implementation FeedAPIClient

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedInstance
{
    static FeedAPIClient *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[FeedAPIClient alloc] init];
    });
    return _sharedInstance;
}

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

- (void)getFeedsWithCompletion:(void (^)(NSArray *feeds, NSError *error))completion
{
    NSString *feedsUrl      = [NSString stringWithFormat:@"%@/feeds", kBaseStringUrl];
    NSDictionary *params    = @{
                                @"detailed" :@1,
                                };
    
    [self doGetWithUrl:feedsUrl
            parameters:params
            completion:^(NSDictionary *response, NSError *error) {
                if(error){
                    completion(nil, error);
                    return;
                }
                
                NSArray *feedsFromServer = (NSArray *)[response objectForKey:@"feeds"];
                
                NSMutableArray *resultFeeds = [@[] mutableCopy];
                for (NSDictionary *feedFromServer in feedsFromServer) {
                    
                    Feed *feed = [FeedMapper mapApiToObject:feedFromServer];
                    if (!feed) {
                        continue;
                    }
                    [resultFeeds addObject:feed];
                }
                completion(resultFeeds, error);
            }];
}

@end
