//
//  TFLogger.m
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import "TFLogger.h"

@implementation TFLogger

///--------------------------------------
#pragma mark - TFLogLevel
///--------------------------------------

+ (NSString *)_descriptionForLogLevel:(TFLogLevel)logLevel {
    NSString *description = nil;
    switch (logLevel) {
        case TFLogLevelNone:
        break;
        
        case TFLogLevelError:
        description = @"Error";
        break;
        
        case TFLogLevelWarning:
        description = @"Warning";
        break;
        
        case TFLogLevelInfo:
        description = @"Info";
        break;
        
        case TFLogLevelDebug:
        description = @"Debug";
        break;
        
        default:
        break;
    }
    return description;
}

///--------------------------------------
#pragma mark - Singleton
///--------------------------------------

+ (instancetype)sharedLogger {
    static TFLogger *logger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logger = [[TFLogger alloc] init];
    });
    return logger;
}

///--------------------------------------
#pragma mark - Init
///--------------------------------------

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    _logLevel = ([self isAppStoreEnvironment] ? TFLogLevelNone : TFLogLevelWarning);
    
    return self;
}

///--------------------------------------
#pragma mark - Methods
///--------------------------------------

- (void)logMessageWithLevel:(TFLogLevel)level
                       file:(const char*)file
                       line:(int)line
                   function:(const char*)function
                     format:(NSString *)format, ... NS_FORMAT_FUNCTION(5, 6) {
    if (level > self.logLevel || level == TFLogLevelNone || !format) {
        return;
    }
    
    va_list args;
    va_start(args, format);
    
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    NSMutableString *message = [NSMutableString stringWithFormat:@"[TFLog][%@] ", [[self class] _descriptionForLogLevel:level]];
    
    [message appendFormat:@"%@:%d %s", fileName, line, function];
    [message appendFormat:@"\n%@", format];
    
    NSLogv(message, args);
    
    va_end(args);
}

- (BOOL)isAppStoreEnvironment {
#if TARGET_OS_IPHONE && !TARGET_IPHONE_SIMULATOR
    return ([[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"] == nil);
#endif
    
    return NO;
}

@end
