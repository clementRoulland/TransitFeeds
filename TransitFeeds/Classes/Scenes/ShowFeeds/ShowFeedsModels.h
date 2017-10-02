//
//  ShowFeedsModels.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface ShowFeedsAnnotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString    *title;
    NSString    *subtitle;
    UIColor     *pinColor;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readonly) UIColor  *pinColor;

- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(NSString *)subtitle
                   coordinate:(CLLocationCoordinate2D)coordinate
                     pinColor:(UIColor *)pinColor;

@end
