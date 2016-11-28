//
//  LoginViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _username.clearButtonMode = UITextFieldViewModeAlways;
    _password.clearButtonMode = UITextFieldViewModeAlways;

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"%s", __func__);
    //拿到目的地控制器,并且用相应的类型接受
    UITabBarController *tabBarController = segue.destinationViewController;
    //设置主色调
    tabBarController.tabBar.tintColor = [UIColor whiteColor];
    //背景色调
    tabBarController.tabBar.barTintColor = [UIColor colorWithRed:220.f/255 green:50.f/255 blue:42.f/255 alpha:1];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    // 登录
    if ([identifier isEqual:@"login"]) {
        // 匹配
        NSString * username = self.username.text;
        NSString * password = self.password.text;
        //从本地获取已经注册了的用户信息
        NSDictionary * userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
        //判断用户名是否存在
        //userInfo中所有的key就是所有已经注册了的用户名
        NSArray * allUsername = [userInfo allKeys];
        
        //判断已经注册的用户名数组中是否包含当前要登陆的的用户名
        BOOL isExist = [allUsername containsObject:username];
        if (!isExist) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"warning!" message:@"用户名不存在！" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"朕已阅" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertController addAction:alertAction];
            return NO;
        }
        //代码执行到这里，说明用户名是存在的，这时要判断这个用户名对应的密码是否匹配
        //把用户名作为key获取userInfo对应的value，value就是注册的密码
        NSString * correctPassword = [userInfo objectForKey:username];
        //把正确的密码和当前输入的密码作比较
        BOOL isCorrectPassword = [correctPassword isEqualToString:password];
        if (!isCorrectPassword) {
            UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"警告" message:@"密码输入有误" preferredStyle:UIAlertControllerStyleActionSheet];
            //present
            [self presentViewController:alertController animated:YES completion:nil];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"本王知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
                
            }];
            [alertController addAction:alertAction];
            return NO;
        }
        //判断输入是否为空，为空则提示请输入
        if (username.length == 0 && password.length == 0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"warning!" message:@"请输入用户名和密码！" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"朕已阅" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertController addAction:alertAction];
            return NO;
        }
        
        // 保存当前成功登陆的账号密码
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:username forKey:@"showUserName"];
        [userDefaults setObject:password forKey:@"showPassword"];
        
        // 立即保存（同步）
        [userDefaults synchronize];
        return YES;
    }
    
    
    
    return YES;
}
//注册
- (IBAction)registerEvent:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册新用户" message:@"请输入用户名和密码：" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"username";
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.secureTextEntry = YES;
        textField.placeholder = @"password";
    }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        // 注册
        //获取已经注册了的用户信息，在此基础上再添加新的用户
        NSMutableDictionary * userInfo = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"]mutableCopy];
        //如果这是第一次注册
        if (userInfo == nil) {
            userInfo = [NSMutableDictionary dictionary];
        }
        // 获得用户注册的账号和密码
        NSString *userName = alertController.textFields[0].text;
        NSString *password = alertController.textFields[1].text;
//        NSLog(@"%@----%@",userName,password);
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        [userDefaults setObject:userName forKey:@"userName"];
//        [userDefaults setObject:password forKey:@"password"];
//        userInfo[@"password"] = password;
        // 将此次用户注册信息写入
//        NSString *username = self.username.text;
//        NSString *password = self.password.text;
        
         // 用户名作为key，密码作为value
        userInfo[userName] = password;
//        [userInfo setObject:password forKey:username];
        // 把拥有新注册用户信息的字典保存在本地
        [[NSUserDefaults standardUserDefaults] setObject:userInfo forKey:@"userInfo"];        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
//忘记密码的警告框
- (IBAction)forgetPassword:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"忘记密码了？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"活该" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:alertAction];
    return;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.username) {
        [self.password becomeFirstResponder];
    }else {
        // login
        [self performSegueWithIdentifier:@"Main" sender:nil];
        [self.view endEditing:YES];
    }
    return YES;
}

@end
