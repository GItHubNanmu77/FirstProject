//
//  SharedMusicPlayer.h
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>
//引入框架
@import AVFoundation;


//单例设计模式
//在应用周期中有且只有一个实例
//生命周期：一旦出现，和程序同生共死

@interface SharedMusicPlayer : NSObject <AVAudioPlayerDelegate>

+ (instancetype)sharedMusicPlayer;

@property (nonatomic, strong, readonly)
AVAudioPlayer * player;

//默认不重复
- (void)playMusicWithURL:(NSURL *)URL;
- (void)playMusicWithURL:(NSURL *)URL repeat:(BOOL) repeat;

@end
