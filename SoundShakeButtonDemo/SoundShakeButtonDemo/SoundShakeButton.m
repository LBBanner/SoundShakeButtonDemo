//
//  SoundShakeButton.m
//  SoundShakeButtonDemo
//
//  Created by 凌斌 on 16/11/4.
//  Copyright © 2016年 ling. All rights reserved.
//

#import "SoundShakeButton.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SoundShakeButton ()
{
    SystemSoundID soundID;
}
@end

@implementation SoundShakeButton

// 重写按钮Touch事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self playSoundEffect:@"buyao" type:@"wav"];
}

- (void)playSoundEffect:(NSString *)name type:(NSString *)type {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSURL *soundURL = [NSURL URLWithString:soundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &soundID);//注册自定义声音(小于30s)到系统声音
    AudioServicesPlaySystemSound(soundID);//播放声音
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);//播放震动
}

@end
