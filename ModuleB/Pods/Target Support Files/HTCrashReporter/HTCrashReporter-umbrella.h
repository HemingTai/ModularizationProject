#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HTCrashConfiguration.h"
#import "HTCrashProxy.h"
#import "HTCrashReporter.h"
#import "NSArray+Swizzling.h"
#import "NSDictionary+Swizzling.h"
#import "NSObject+Swizzling.h"
#import "NSString+Swizzling.h"

FOUNDATION_EXPORT double HTCrashReporterVersionNumber;
FOUNDATION_EXPORT const unsigned char HTCrashReporterVersionString[];

