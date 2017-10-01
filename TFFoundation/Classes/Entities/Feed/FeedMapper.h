//
//  FeedMapper.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"

@interface FeedMapper : NSObject

///--------------------------------------
#pragma mark - Metohds
///--------------------------------------

/**
 Map api dictionnary to Feed object
 Return nil if required field missing

 @param apiFeed disctionary of feed attributes
 @return Feed object
 */
+ (Feed *)mapApiToObject:(NSDictionary *)apiFeed;

@end
