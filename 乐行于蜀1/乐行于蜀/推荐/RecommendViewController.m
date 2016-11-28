//
//  RecommendViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "RecommendViewController.h"
#import "DetailViewController.h"

@interface RecommendViewController ()

@property (nonatomic, copy) NSArray *animationViews;
@property (weak, nonatomic) IBOutlet UIButton *theplace;
@property (weak, nonatomic) IBOutlet UIButton *starbucks;
@property (weak, nonatomic) IBOutlet UIButton *maanCoffee;
@property (weak, nonatomic) IBOutlet UIButton *goodWood;
@property (weak, nonatomic) IBOutlet UIButton *winsharer;
@property (nonatomic, assign) BOOL animated;

@end

static NSInteger animationIndex = 0;

@implementation RecommendViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationViews = @[self.theplace,self.starbucks,self.maanCoffee,self.goodWood,self.winsharer];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.animated = YES;
    animationIndex = 0;
    [self animation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.animated = NO;
}

- (void)animation{
    if (self.animated) {
        [UIView transitionWithView:self.animationViews[animationIndex] duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:NULL completion:^(BOOL finished) {
            animationIndex ++;
            
            if (animationIndex == 5) {
                animationIndex = 0;
            }
            [self animation];
        }];
    }
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSInteger index = [self.animationViews indexOfObject:sender];
//    NSLog(@"index = %ld", index);
    
    NSArray *contentArray = @[@"推荐：theplace.txt", @"推荐：星巴克.txt", @"推荐：漫咖啡.txt", @"推荐：良木缘.txt", @"推荐：轩客会.txt"];
    NSArray *imageArray = @[@"theplace_coffee_detail.png",@"starbucks_coffee_detail.png",@"man_coffee_detail.png",@"goodwoods_coffee.detail.png",@"winshare_detail.png"];
    DetailViewController *vc = segue.destinationViewController;
    vc.content = contentArray[index];
    vc.imageName = imageArray[index];
}

- (IBAction)handleAnimationEvent:(UIButton *)sender {
    //类方法

    [self performSegueWithIdentifier:@"Detail" sender:sender];
    [UIView animateWithDuration:0.5 animations:^{
//        //改变中心点
//        sender.center = self.view.center;
//        sender.backgroundColor = [UIColor redColor];
//        sender.transform = CGAffineTransformMakeRotation(M_PI);
//        //在原有的transform基础之上进行修改(多旋转360度)
//        sender.transform = CGAffineTransformRotate(sender.transform, M_PI);
//        sender.transform = CGAffineTransformInvert(sender.transform);
        
    } completion:^(BOOL finished) {
        
//        [UIView transitionWithView:sender duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//            //transform恢复成默认值
//            sender.transform = CGAffineTransformIdentity;
//            sender.backgroundColor = [UIColor lightGrayColor];
//        } completion:NULL];
        
    }];
}


@end
