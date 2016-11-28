//
//  SharedMusicPlayer.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "SharedMusicPlayer.h"

@implementation SharedMusicPlayer

+ (instancetype)sharedMusicPlayer {
    //1.初始化
    static id instance = nil;
    //2.只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //这里的代码只会被执行一次，并且是现成安全的
        instance = [[[self class] alloc] init];
        //设置独特的属性
    });
    return instance;
}

- (void)playMusicWithURL:(NSURL *)URL {
    [self playMusicWithURL:URL repeat:NO];
}

- (void)playMusicWithURL:(NSURL *)URL repeat:(BOOL)repeat {
    // 1.初始化音乐播放器
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    // 2.prepare
    [_player prepareToPlay];
    // 3.play
    [_player play];
    if (repeat) {
        _player.numberOfLoops = -1; // 负数代表无穷
    }
    // 4.delegate 获取事件回调
    _player.delegate = self;
    
}

#pragma mark delegate

// 前提delegate = self；
//播放完毕自动调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"%s",__func__);
}

@end
