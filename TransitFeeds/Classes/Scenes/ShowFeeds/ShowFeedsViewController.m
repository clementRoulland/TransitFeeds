//
//  ShowFeedsViewController.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <TFFoundation/TFFoundation.h>
#import "ShowFeedsViewController.h"

@interface ShowFeedsViewController ()

@end

@implementation ShowFeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[FeedStore sharedInstance] getFeedsWithCompletion:^(NSArray *feeds, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (Feed *feed in feeds) {
                NSLog(@"%@", feed.name);
            }
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
