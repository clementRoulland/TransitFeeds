//
//  ViewController.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "ViewController.h"
#import <TFFoundation/TFFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[FeedStore sharedInstance] getFeedsWithCompletion:^(NSArray *feeds, NSError *error) {
        for (Feed *feed in feeds) {
            NSLog(@"%@", feed.name);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
