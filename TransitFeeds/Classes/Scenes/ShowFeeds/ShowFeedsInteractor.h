//
//  ShowFeedsInteractor.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TFFoundation/TFFoundation.h>
#import "ShowFeedsPresenter.h"

///--------------------------------------
#pragma mark - ShowFeedsInteractorProtocol
///--------------------------------------

@protocol ShowFeedsInteractorProtocol

- (void)getFeeds;

@end

///--------------------------------------
#pragma mark - ShowFeedsInteractor
///--------------------------------------

@interface ShowFeedsInteractor : NSObject <ShowFeedsInteractorProtocol>

@property NSObject<ShowFeedsPresenterProtocol> *presenter;

@end
