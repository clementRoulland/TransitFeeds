//
//  TFLogger.h
//  TFFoundation
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#import <Foundation/Foundation.h>

///--------------------------------------
#pragma mark - TFLogLevel
///--------------------------------------

typedef NS_ENUM(NSInteger, TFLogLevel) {
    /**
     No logs
     */
    TFLogLevelNone = 0,
    /**
     Only error logs
     */
    TFLogLevelError = 1,
    /**
     Errors and warnings logs
     */
    TFLogLevelWarning = 2,
    /**
     Errors, warnings and info logs
     */
    TFLogLevelInfo = 3,
    /**
     Errors, warnings, info and debug logs
     */
    TFLogLevelDebug = 4
};

///--------------------------------------
#pragma mark - TFLogger
///--------------------------------------

@interface TFLogger : NSObject

///--------------------------------------
#pragma mark Properties
///--------------------------------------

/// Logs level
@property (atomic, assign) TFLogLevel logLevel;

///--------------------------------------
#pragma mark Singleton
///--------------------------------------

/**
 A shared instance of `TFLogger` that should be used for all logging.
 
 @returns An shared singleton instance of `TFLogger`.
 */
+ (instancetype)sharedLogger;

///--------------------------------------
#pragma mark Methods
///--------------------------------------

/**
 Logs a message at a specific level for a tag.
 If current logging level doesn't include this level - this method does nothing.
 
 @param level  Logging Level
 @param format Format to use for the log message.
 */
- (void)logMessageWithLevel:(TFLogLevel)level
                       file:(const char*)file
                       line:(int)line
                   function:(const char*)function
                     format:(NSString *)format, ... NS_FORMAT_FUNCTION(5, 6);

@end
