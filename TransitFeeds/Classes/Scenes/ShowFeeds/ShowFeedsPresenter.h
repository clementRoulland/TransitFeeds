//
//  ShowFeedsPresenter.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowFeedsViewController.h"

@protocol ShowFeedsPresenterProtocol

- (void)presentFeeds:(NSArray *)feeds;

@end

@interface ShowFeedsPresenter : NSObject <ShowFeedsPresenterProtocol>

@property (weak) NSObject<ShowFeedsViewControllerProtocol> *viewController;

@end
