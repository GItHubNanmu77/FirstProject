//
//  SceneDetailViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "SceneDetailViewController.h"

@interface SceneDetailViewController ()
//{
//    NSTimer *_timer;
//}

@property (weak, nonatomic) IBOutlet UIScrollView *sceneDetailScrollView;
@property (weak, nonatomic) IBOutlet UITextView *sceneDetailTextView;

//@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation SceneDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.sceneDetailImageView.image = [UIImage imageNamed:self.sceneImageName];
    // 添加视图的方法
    [self addSubsViewWithScrollView];
    // 1. 获取文件完整路径, self.content 代表文件名
    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:self.sceneContent];
    // 2. 通过路径读取字符串
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    self.sceneDetailTextView.text = text;
    
    //启动timer
//    _timer = [self startTimer:_timer];
}

// 添加滚动视图图片
- (void)addSubsViewWithScrollView {
    
    self.sceneDetailScrollView.pagingEnabled = YES;
    // 先获得scrollView的尺寸
    CGSize imageSize = self.sceneDetailScrollView.bounds.size;
    // 循环添加图片视图
    for (NSInteger index = 0; index < 3; index ++) {
        // 创建图片视图
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(index * imageSize.width, 0, imageSize.width, imageSize.height);
        
        // 设置图片
        NSString *imageName = [NSString stringWithFormat:@"%@%ld.jpg",_sceneImageName,index + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.sceneDetailScrollView addSubview:imageView];
    }
    // 设置滚动范围
    self.sceneDetailScrollView.contentSize = CGSizeMake(imageSize.width * 3, 0);
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

/*
//开始
- (NSTimer *)startTimer:(NSTimer *)timer {
    if (!timer) {
        // 1. 代表重复时长
        // 2. 代表执行对象
        // 3. 代表执行方法
        // 4. 代表信息，一般为nil
        // 5. 代表是否重复执行
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
        //提升timer的优先级（否则和scrollView滑动冲突）
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    // 1s后执行
    timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    return timer;
}
//暂停
- (void)pauseTimer:(NSTimer *)timer {
    // 在遥远的将来执行
    timer.fireDate = [NSDate distantFuture];
}
//结束
- (void)stopTimer:(NSTimer *)timer {
    [timer invalidate];
    timer = nil;
}
//处理事件
-(void)handleTimer:(NSTimer *)timer {
    static int index = 2;
    NSString *imageName = [NSString stringWithFormat:@"首页%d",index];
    self.sceneDetailImageView.image = [UIImage imageNamed:imageName];
    index ++;
    if (index ==4){
        index = 1;
    }
}

*/
@end
