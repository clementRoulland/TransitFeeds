//
//  ShowFeedsPresenter.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ShowFeedsPresenter.h"
#import <TFFoundation/TFFoundation.h>
#import "ShowFeedsModels.h"

@implementation ShowFeedsPresenter

- (void)presentFeeds:(NSArray *)feeds
{
    NSMutableArray *annotations = [@[] mutableCopy];
    for (Feed *feed in feeds) {
        ShowFeedsAnnotation *annotation = [[ShowFeedsAnnotation alloc] initWithTitle:feed.name
                                                                            subtitle:feed.city
                                                                          coordinate:feed.coordinate];
        [annotations addObject:annotation];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController displayAnnotations:annotations];
    });
}

@end
