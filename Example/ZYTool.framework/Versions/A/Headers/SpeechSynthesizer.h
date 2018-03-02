//
//  SpeechSynthesizer.h
//
//  Created by Zy.
//  Copyright © 2016年 Zy. All rights reserved.
//
//  SpeechSynthesizer

#import <UIKit/UIKit.h>

/**
 * 文字语音播报.
 *  对传入的文字信息进行语音播放.
 */
@interface SpeechSynthesizer : NSObject

/**
 * 单例方法.
 */
+ (instancetype)sharedInstance;

/**
 * 文字转语音播放.
 *  @param string 要播放的文字.
 *  @return YES/NO.
 */
- (BOOL)speakString:(NSString *)string;

/**
 * 停止播放.
 */
- (void)stopSpeak;

@end
