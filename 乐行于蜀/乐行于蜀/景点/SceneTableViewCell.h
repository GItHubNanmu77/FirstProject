//
//  SceneTableViewCell.h
//  乐行于蜀
//
//  Created by rimi on 16/2/27.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SceneTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *sceneImageView;
@property (weak, nonatomic) IBOutlet UILabel *sceneNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
