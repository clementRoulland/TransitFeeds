//
//  ShowFeedsViewController.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <TFFoundation/TFFoundation.h>
#import "ShowFeedsViewController.h"
#import "ShowFeedsInteractor.h"

@interface ShowFeedsViewController ()

@property NSObject<ShowFeedsInteractorProtocol> *interactor;

@end

@implementation ShowFeedsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self) {
        [self setupScene];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupScene];
    }
    
    return self;
}

- (void)setupScene
{
    ShowFeedsInteractor *interactor = [[ShowFeedsInteractor alloc] init];
    self.interactor = interactor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.interactor getFeeds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
