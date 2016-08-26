//
//  MXSpeaker.m
//  MXSpeaker-OC-Demo
//
//  Created by Meniny on 16/8/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXSpeaker.h"
#import <AVFoundation/AVFoundation.h>

@interface MXSpeaker ()
@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
@end

@implementation MXSpeaker
+ (instancetype)defaultManager {
    static MXSpeaker *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [MXSpeaker new];
    });
    return instance;
}

- (AVSpeechSynthesizer *)speechSynthesizer {
    if (_speechSynthesizer == nil) {
        _speechSynthesizer = [AVSpeechSynthesizer new];
    }
    return _speechSynthesizer;
}

+ (void)speak:(NSString *)text {
    [[MXSpeaker defaultManager] speak:text];
}

- (void)speak:(NSString *)text {
    if (text != nil && [text isKindOfClass:[NSString class]] && [text length]) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf stop];
            AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:text];
            utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
            [[strongSelf speechSynthesizer] speakUtterance:utterance];
        });
    }
}

+ (void)speakWithFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    [[MXSpeaker defaultManager] speak:string];
}

+ (void)pause {
    [[MXSpeaker defaultManager] pause];
}

- (void)pause {
    if ([[self speechSynthesizer] isSpeaking]) {
        [[self speechSynthesizer] pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

+ (void)continueSpeaking {
    [[MXSpeaker defaultManager] continueSpeaking];
}

- (void)continueSpeaking {
    if ([[self speechSynthesizer] isPaused]) {
        [[self speechSynthesizer] continueSpeaking];
    }
}

+ (void)stop {
    [[MXSpeaker defaultManager] stop];
}

- (void)stop {
    if ([[self speechSynthesizer] isSpeaking] ||
        [[self speechSynthesizer] isPaused]) {
        [[self speechSynthesizer] stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

@end
