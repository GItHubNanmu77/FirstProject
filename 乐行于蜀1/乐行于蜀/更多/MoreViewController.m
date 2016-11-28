//
//  MoreViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "MoreViewController.h"
#import "SharedMusicPlayer.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentUserNameL;
@property (weak, nonatomic) IBOutlet UILabel *currentPasswordL;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.currentUserNameL.text = [userDefaults objectForKey:@"showUserName"];
    self.currentPasswordL.text = [userDefaults objectForKey:@"showPassword"];
}


- (IBAction)handleMusicVolume:(UISlider *)sender {
    // 1.获取单例
    SharedMusicPlayer * player = [SharedMusicPlayer sharedMusicPlayer];
    // 2.设置音量
    player.player.volume = sender.value;
}


@end
