//
//  MainViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
    NSTimer *_timer;
}

@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //关闭自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 199)];
    imageView.image = [UIImage imageNamed:@"首页1"];
    [self.ScrollView addSubview:imageView];
    //属性关联
    self.imageView = imageView;
    
    //label1
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 199, 320, 0)];
    label1.numberOfLines = 0;
    label1.text = @"成都，简称“蓉”，四川省省会，副省级市，国家区域中心城市（西南），1993年被国务院确定为西南地区的科技、商贸、金融中心和交通及通信枢纽，综合实力西部第一。";
    [label1 sizeToFit];
    [self.ScrollView addSubview:label1];
    //imageView1
    UIImageView * imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label1.frame), 320, 199)];
    imageView1.image = [UIImage imageNamed:@"首页1"];
    [self.ScrollView addSubview:imageView1];
    
    //label2
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 199+CGRectGetMaxY(label1.frame), 320, 0)];
    label2.numberOfLines = 0;
    label2.text = @"成都位于中国华西地区东部，西南地区最大平原——成都平原腹地，境内地势平坦、河网纵横、物产丰富、水系发达，自古就有“天府之国”的美誉，是国家首批历史文化名城和中国最佳旅游城市。";
    [label2 sizeToFit];
    [self.ScrollView addSubview:label2];
    //    //imageView2
    UIImageView * imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame), 320, 199)];
    imageView2.image = [UIImage imageNamed:@"首页2"];
    [self.ScrollView addSubview:imageView2];
    
    //label3
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 199+CGRectGetMaxY(label2.frame), 320, 0)];
    label3.numberOfLines = 0;
    label3.text = @"成都有着4500余年的文明史，2600年左右的建城史。三国蜀汉、五代前后蜀及北宋李顺、明末张献忠大西等割据政权先后在此建都，唐朝和中华民国时曾作为临时首都而存在。早在北宋年间成都人联合发行了世界最早的纸币“交子”，官府在成都设立了世界最早的管理储蓄银行“交子务”。";
    [label3 sizeToFit];
    [self.ScrollView addSubview:label3];
    //imageView3
    UIImageView * imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame), 320, 199)];
    imageView3.image = [UIImage imageNamed:@"首页3"];
    [self.ScrollView addSubview:imageView3];
    
    self.ScrollView.contentSize = CGSizeMake(320, 199+CGRectGetMaxY(label3.frame));
    //启动timer
    _timer = [self startTimer:_timer];
    
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self stopTimer:_timer];
//}

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
////结束
//- (void)stopTimer:(NSTimer *)timer {
//    [timer invalidate];
//    timer = nil;
//}
//处理事件
-(void)handleTimer:(NSTimer *)timer {
        static int index = 2;
        NSString *imageName = [NSString stringWithFormat:@"首页%d",index];
    self.imageView.image = [UIImage imageNamed:imageName];
    index ++;
    if (index ==4){
        index = 1;
    }
}


@end
