//
//  TFAPIClient.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "TFAPIClient.h"

@interface TFAPIClient ()

@property NSURLSession *session;

@end

@implementation TFAPIClient

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedInstance
{
    static TFAPIClient *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[TFAPIClient alloc] init];
    });
    return _sharedInstance;
}

///--------------------------------------
#pragma mark - Init
///--------------------------------------

- (id)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig];
    }
    return self;
}

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

- (void)doGetWithUrl:(NSString*)stringUrl
          parameters:(NSDictionary*)parameters
          completion:(void (^)(NSDictionary *response, NSError *error))completion
{
    if([parameters count] > 0){
        stringUrl = [NSString stringWithFormat:@"%@?%@", stringUrl, [TFAPIClient encodeDictionaryToString:parameters]];
    }
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"GET"];
    
    TFLogDebug(@"Get on: %@\nWith params: %@", [url absoluteString], parameters);
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *response, NSError *error) {
        
        NSDictionary *dictionary = [self getResultFromUrl:url data:taskData response:response error:&error];
        completion(dictionary, error);
    }] resume];
}

- (NSDictionary *)getResultFromUrl:(NSURL*)url
                              data:(NSData*)data
                          response:(NSURLResponse*)response
                             error:(NSError**)error
{
    NSMutableDictionary *dictionary = [@{} mutableCopy];
    if ([data length] > 0) {
        dictionary = [[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error] mutableCopy];
    }
    if ([dictionary isKindOfClass:[NSArray class]]) {
        dictionary = [@{@"list": dictionary} mutableCopy];
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    if (httpResponse.statusCode >= 400){
        *error = [[NSError alloc] initWithDomain:@"Error detected" code:httpResponse.statusCode userInfo:dictionary];
    }
    NSNumber *statusCode = [NSNumber numberWithLong:(long)httpResponse.statusCode];
    [dictionary setValue:statusCode forKey:@"_statusCode"];
    
    TFLogDebug(@"Result from: %@\nResponseCode: %ld\nError: %@\nResponseData:\n%@", [url absoluteString], (long)httpResponse.statusCode, *error, dictionary);
    
    return dictionary;
}

///--------------------------------------
#pragma mark - Handle encode
///--------------------------------------

+ (NSString*)encodeDictionaryToString:(NSDictionary*)dictionary {
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        id value = [dictionary objectForKey:key];
        if([value respondsToSelector:@selector(stringValue)]){
            value = [value stringValue];
        }
        if(![value isKindOfClass:[NSString class]]){
            continue;
        }
        NSString *encodedValue = [self percentEscapeString:value];
        NSString *encodedKey = [self percentEscapeString:key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    
    return [parts componentsJoinedByString:@"&"];
}

///--------------------------------------
#pragma mark - Handle string
///--------------------------------------

+ (NSString *)percentEscapeString:(NSString *)string
{
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                     (CFStringRef)string,
                                                                     NULL,
                                                                     (CFStringRef)@":/?@!$&'()*+,;=",
                                                                     kCFStringEncodingUTF8));
}

@end
