//
//  TFLog.h
//  TransitFeeds
//
//  Created by Clement Roulland on 17-10-01.
//  Copyright © 2017 Brozh. All rights reserved.
//

#ifndef TFLog_h
#define TFLog_h

#import "TFLogger.h"

#define TFLog(level, frmt, ...) \
[[TFLogger sharedLogger] logMessageWithLevel:level file:__FILE__ line:__LINE__ function:__PRETTY_FUNCTION__ format:(frmt), ##__VA_ARGS__]

#define TFLogError(frmt, ...) \
TFLog(TFLogLevelError, (frmt), ##__VA_ARGS__)

#define TFLogWarning(frmt, ...) \
TFLog(TFLogLevelWarning, (frmt), ##__VA_ARGS__)

#define TFLogInfo(frmt, ...) \
TFLog(TFLogLevelInfo, (frmt), ##__VA_ARGS__)

#define TFLogDebug(frmt, ...) \
TFLog(TFLogLevelDebug, (frmt), ##__VA_ARGS__)

#endif /* TFLog_h */
