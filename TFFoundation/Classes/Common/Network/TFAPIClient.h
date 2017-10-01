//
//  TFAPIClient.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFAPIClient : NSObject

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

/**
 Send request with GET HTTP method
 @param stringUrl  URL of the requested resource
 @param parameters NSDictionary of parameters passed in the request
 @param completion Block executed with request result
 */
- (void)doGetWithUrl:(NSString*)stringUrl
          parameters:(NSDictionary*)parameters
          completion:(void (^)(NSDictionary *response, NSError *error))completion;

@end
