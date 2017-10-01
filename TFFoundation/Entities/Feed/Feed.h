//
//  Feed.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

///--------------------------------------
#pragma mark - Properties
///--------------------------------------

/// Feed name
@property (readonly) NSString *name;
/// Feed city
@property (readonly) NSString *city;
/// Feed country code
@property (readonly) NSString *countryCode;


///--------------------------------------
#pragma mark - Init
///--------------------------------------

/**
 Init Feed with name, city and countryCode

 @param name        feed name
 @param city        feed city
 @param countryCode feed countryCode
 @return            created feesd
 */
- (instancetype)initWithName:(NSString *)name
                        city:(NSString *)city
                 countryCode:(NSString *)countryCode;

@end
