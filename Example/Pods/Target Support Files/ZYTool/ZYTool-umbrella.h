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

#import "SpeechSynthesizer.h"
#import "UserDefaultsTool.h"
#import "ZYFileManager.h"
#import "ZYToast.h"
#import "ZYTool.h"
#import "ZYDeviceIPAdresses.h"
#import "ZYKeyChainManager.h"
#import "ZYUUIDManager.h"

FOUNDATION_EXPORT double ZYToolVersionNumber;
FOUNDATION_EXPORT const unsigned char ZYToolVersionString[];

