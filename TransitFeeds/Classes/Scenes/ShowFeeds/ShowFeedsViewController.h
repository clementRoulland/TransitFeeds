//
//  ShowFeedsViewController.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowFeedsViewControllerProtocol

- (void)displayPins;

@end

@interface ShowFeedsViewController : UIViewController <ShowFeedsViewControllerProtocol>

@end
