//
//  MXSpeaker.h
//  MXSpeaker-OC-Demo
//
//  Created by Meniny on 16/8/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Speaker.h"

@interface MXSpeaker : NSObject
+ (void)speak:(NSString *)text;
+ (void)speakWithFormat:(NSString *)format, ...;
+ (void)pause;
+ (void)continueSpeaking;
+ (void)stop;
@end
