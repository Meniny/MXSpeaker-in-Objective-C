//
//  NSString+Speaker.m
//  MXSpeaker-OC-Demo
//
//  Created by Meniny on 16/8/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "NSString+Speaker.h"
#import "MXSpeaker.h"

@implementation NSString (Speaker)
- (void)speak {
    [MXSpeaker speak:self];
}
@end
