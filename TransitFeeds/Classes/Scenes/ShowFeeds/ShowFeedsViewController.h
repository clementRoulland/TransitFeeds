//
//  ShowFeedsViewController.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <UIKit/UIKit.h>

///--------------------------------------
#pragma mark - ShowFeedsViewControllerProtocol
///--------------------------------------

@protocol ShowFeedsViewControllerProtocol

- (void)displayAnnotations:(NSArray*)annotations;

@end

///--------------------------------------
#pragma mark - ShowFeedsViewController
///--------------------------------------

@interface ShowFeedsViewController : UIViewController <ShowFeedsViewControllerProtocol>

@end
