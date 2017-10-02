//
//  ShowFeedsViewController.m
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <TFFoundation/TFFoundation.h>
#import <MapKit/MapKit.h>
#import "ShowFeedsViewController.h"
#import "ShowFeedsInteractor.h"
#import "ShowFeedsModels.h"

@interface ShowFeedsViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property NSObject<ShowFeedsInteractorProtocol> *interactor;

@end

@implementation ShowFeedsViewController

static NSString * const kAnnotationIdentifier = @"ShowFeedsAnnotationIdentifier";

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
    ShowFeedsPresenter  *presenter  = [[ShowFeedsPresenter alloc] init];
    
    interactor.presenter        = presenter;
    presenter.viewController    = self;
    
    self.interactor = interactor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.interactor getFeeds];
}

- (void)displayAnnotations:(nonnull NSArray<id<MKAnnotation>> *)annotations
{
    [self.mapView showAnnotations: annotations animated:true];
    NSLog(@"%s %lu", __FUNCTION__, (unsigned long)annotations.count);
}

@end

@implementation ShowFeedsViewController (MKMapViewDelegate)

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (@available(iOS 11.0, *)) {
        MKMarkerAnnotationView *marker = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationIdentifier];
        if (!marker) {
            marker = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationIdentifier];
        }
        marker.markerTintColor = ((ShowFeedsAnnotation *)annotation).pinColor;
        return marker;
    }
    
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationIdentifier];
    if (!pin) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationIdentifier];
    }
    if (@available(iOS 9.0, *)) {
        pin.pinTintColor = ((ShowFeedsAnnotation *)annotation).pinColor;
    }
    return pin;
    
}

@end
