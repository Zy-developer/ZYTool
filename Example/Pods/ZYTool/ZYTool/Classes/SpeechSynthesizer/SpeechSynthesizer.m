//
//  SpeechSynthesizer.m
//
//  Created by Zy.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "SpeechSynthesizer.h"
#import <AVFoundation/AVFoundation.h>

@interface SpeechSynthesizer () <AVSpeechSynthesizerDelegate>
{
    AVSpeechSynthesizer *_speechSynthesizer;
}

@end

@implementation SpeechSynthesizer

#pragma mark - 单例
static SpeechSynthesizer *sharedInstance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [super allocWithZone:zone];
        });
    }
    return sharedInstance;
}

#pragma mark - Init
- (instancetype)init {
    if (self = [super init]) {
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        [_speechSynthesizer setDelegate:self];
        // 注册打断通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AVAudioSessionInterruptionNotification:) name:AVAudioSessionInterruptionNotification object:nil];
    }
    return self;
}

#pragma mark - 接收通知方法
- (void)AVAudioSessionInterruptionNotification: (NSNotification *)notificaiton {
//    NSLog(@"Notificaiton:　%@", notificaiton.userInfo);
}

#pragma mark - 文字转语音播放
- (BOOL)speakString:(NSString *)string {
    if (_speechSynthesizer) {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
        [utterance setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
        utterance.volume = 1.0f;
        if ([_speechSynthesizer isSpeaking])
            [_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        [_speechSynthesizer speakUtterance:utterance];
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 停止播放
- (void)stopSpeak {
    if (_speechSynthesizer) {
        [_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
}

#pragma mark - Dealloc
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioSessionInterruptionNotification object:nil];
    _speechSynthesizer.delegate = nil;
    _speechSynthesizer = nil;
}

@end
