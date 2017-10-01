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

@property FeedAPIClient *feedApiClient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.feedApiClient = [FeedAPIClient sharedInstance];
    
    [self.feedApiClient getFeedsWithCompletion:^(NSArray *feeds, NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
