//
//  LoginViewController.m
//  轻松学
//
//  Created by Mr.Lin on 18/5/12.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "LoginViewController.h"
#import "SizeHeader.h"
#import "LoginView.h"
#import "SiginViewController.h"
#import "ForgetViewController.h"



#import "ResourcesLibViewController.h"
#import "MainViewController.h"
#import "MineViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    
    [topBarView setHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addLoginBackgroundView:[[UIScreen mainScreen] bounds]];
    [self AllButtons:[[UIScreen mainScreen] bounds]];
    [self UserTextField:self.backgroundView.frame];
    [self PasswordTextField:self.backgroundView.frame];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark-----------------添加textField的背景View
- (void)addLoginBackgroundView:(CGRect)frame{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //image1
    UIImageView *mimageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth ,LRYScreenpH(341))];
    mimageview1.backgroundColor = [UIColor whiteColor];
    mimageview1.image = [UIImage imageNamed:@"dl_bg"];
    //mimageview1.contentMode = UIViewContentModeScaleAspectFit;//保真
    //image2
    UIImageView *mimageview2 =[[UIImageView alloc]initWithFrame:CGRectMake((LRYScreenpW(750)-LRYScreenpW(135))/2, (LRYScreenpH(330)-LRYScreenpH(171))/2, LRYScreenpW(135), LRYScreenpH(171))];
    mimageview2.image = [UIImage imageNamed:@"1.1"];
    mimageview2.contentMode = UIViewContentModeScaleAspectFit;//保真
    [self.view addSubview:mimageview1];
    [self.view addSubview:mimageview2];
    
#pragma mask-----------------横线设置
    ///横线
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, LRYScreenpH(330), LRYScreenpW(750), LRYScreenpH(26))];
    label1.backgroundColor = LRYUIColorFromRGB(0x00aeff, 1.0);
    label1.userInteractionEnabled = NO;
    [self.view addSubview:label1];
#pragma mask---------------账户密码背景视图
    self.backgroundView = [[LoginView alloc] initWithFrame:CGRectMake(LRYScreenpW(53),LRYScreenpH(444),LRYScreenpW(644),LRYScreenpH(213))];
    [self.backgroundView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.backgroundView];
}


#pragma mask---------------账户框
- (void)UserTextField:(CGRect)frame{
    self.userTextField = [[BasicTextField alloc] initWithFrame:CGRectMake(0, LRYScreenpH(5), LRYScreenpW(540), LRYScreenpH(60))];
    self.userTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.userTextField.delegate = self;
    self.userTextField.tag = 1000001;
    self.userTextField.placeholder = @"请输入账号";
    [self.userTextField setValue:LRYUIColorFromRGB(0xb9c1d6, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.userTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.userTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_11"]];
    self.userTextFieldImage.contentMode = UIViewContentModeScaleAspectFill;//保真
    self.userTextField.leftView = self.userTextFieldImage;
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    //self.userTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.userTextField.keyboardType = UIKeyboardTypeNumberPad;
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.userTextField];
    self.isPasswordEmpty = YES;
    //self.userTextField.clearsOnBeginEditing = YES;
    [self.backgroundView addSubview:self.userTextField];
}

#pragma mask---------------密码框
- (void)PasswordTextField:(CGRect)frame{
    self.passwordTextField = [[BasicTextField alloc] initWithFrame:CGRectMake(0, LRYScreenpH(125), LRYScreenpW(540), LRYScreenpH(60))];
    self.passwordTextField.delegate = self;
    self.passwordTextField.tag = 10000011;
    self.passwordTextField.placeholder = @"请输入密码";
    [self.passwordTextField setValue:LRYUIColorFromRGB(0xb9c1d6, 1.0) forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.passwordTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_12"]];
    self.passwordTextFieldImage.contentMode = UIViewContentModeScaleAspectFill;//保真
    self.passwordTextField.leftView = self.passwordTextFieldImage;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    self.passwordTextField.returnKeyType = UIReturnKeyGo;
    
    //self.passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    //self.passwordTextField.clearsOnBeginEditing = YES;
    self.passwordTextField.secureTextEntry = YES;
    //设置监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passwordTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.passwordTextField];
    self.isUserEmpty = YES;
    [self.backgroundView addSubview:self.passwordTextField];
}



#pragma mask---------------登录按钮、忘记按钮
- (void)AllButtons:(CGRect)frame{
    
    
    //登录button
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(LRYScreenpW(60), LRYScreenpH(810), LRYScreenpW(629), LRYScreenpH(72))];
    [self.loginButton setEnabled:NO];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    self.loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.loginButton setTitleColor:LRYUIColorFromRGB(0xffffff, 0.5) forState:UIControlStateReserved];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"dl_login_btn"] forState:UIControlStateNormal ];
    self.loginButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.loginButton addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.loginButton];
    
    //注册按钮
    self.signButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(60), LRYScreenpH(900), LRYScreenpW(629), LRYScreenpW(72))];
    [self.signButton setEnabled:YES];
    [self.signButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.signButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    self.signButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.signButton setTitleColor:LRYUIColorFromRGB(0x00aeff, 1.0) forState:UIControlStateNormal];
    [self.signButton addTarget:self action:@selector(SignTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signButton];
    
    //可见密码按钮
    self.seeButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(588), LRYScreenpH(132), LRYScreenpW(35), LRYScreenpH(46))];
    self.seeButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.seeButton setImage:[UIImage imageNamed:@"dl_8"] forState:UIControlStateNormal];
    [self.seeButton addTarget:self action:@selector(SeeTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundView addSubview:self.seeButton];
    //忘记密码
    UIButton *forgetButton = [[UIButton alloc] initWithFrame:CGRectMake(LRYScreenpW(565), LRYScreenpH(695), LRYScreenpW(140), LRYScreenpH(30))];
    [forgetButton addTarget:self action:@selector(clickForgetpasswordTextFieldButton:) forControlEvents:UIControlEventTouchDown];
    [forgetButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15.5)]];
    forgetButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    [forgetButton setTitleColor:LRYUIColorFromRGB(0x4b5162, 1.0) forState:UIControlStateNormal];
    [self.view addSubview:forgetButton];
}




- (void)addLogioningActivityIndicatorView{
    CGFloat logioningActivityIndicatorViewX = self.loginButton.frame.origin.x + 80;
    CGFloat logioningActivityIndicatorViewY = self.loginButton.frame.origin.y;
    CGFloat logioningActivityIndicatorViewWH = self.loginButton.frame.size.height;
    self.logioningActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(logioningActivityIndicatorViewX, logioningActivityIndicatorViewY, logioningActivityIndicatorViewWH, logioningActivityIndicatorViewWH)];
    [self.view addSubview:self.logioningActivityIndicatorView];
}

- (void)clickLoginButton:(id)sender{
    [self.loginButton setTitle:@"登录中..." forState:UIControlStateNormal];
    [self addLogioningActivityIndicatorView];
    [self.logioningActivityIndicatorView startAnimating];
    
    //当点击登录按钮时，账号和密码输入框放弃第一响应者，此时键盘退出
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];


    
    
//返回
    [self dismissModalViewControllerAnimated:YES];
        
}

- (void)clickForgetpasswordTextFieldButton:(id)sender
{
    //点击忘记密码button后需要执行的代码
    ForgetViewController *forgetView =[[ForgetViewController alloc]init];
    [self presentModalViewController:forgetView animated:YES];
    
}
-(void)SeeTap:(UIButton *)sender
{
    
    if (self.passwordTextField.secureTextEntry == NO)
    {
        self.passwordTextField.secureTextEntry = YES;
    }
    else
    {
        self.passwordTextField.secureTextEntry = NO;
        
    }
}

-(void)SignTap:(UIButton *)sender
{
    SiginViewController *siginView = [[SiginViewController alloc]init];
    [self presentModalViewController:siginView animated:YES];
}


#pragma makr --UITextFieldDelegate
//UITextField的代理方法，点击键盘return按钮退出键盘

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    
    [self.passwordTextField resignFirstResponder];
    return YES;
}
//- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    //当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。
//    //这对于想要加入撤销选项的应用程序特别有用
//    //可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途。
//    //要防止文字被改变可以返回NO
//    //这个方法的参数中有一个NSRange对象，指明了被改变文字的位置，建议修改的文本也在其中
//    UITextField *text1 = [self.view viewWithTag:1000];//规定要小于10位
//    UITextField *text2 = [self.view viewWithTag:1001];//规定要小于5位
//    //每次输入检测字符长度范围
//    if ([textField isEqual:text1]) {
//        if (range.location > 10) {
//            text1.text = [text1.text substringToIndex:11];
//            return NO;
//        }
//    }else {
//        if (range.location > 5) {
//            text1.text = [text1.text substringToIndex:6];
//            return NO;
//        }
//    }
//    
//    return YES;
//}





//优化1：检测是否输入为11位号码，密码是否为6位以上（我觉得在程序里进行简单判断会减少后台压力）
//优化2：在点击登录后，删除改动号码将停止，并将登录按钮初始化为原来的样子
//优化3：逻辑优化还未完成
//userTextField的监听方法
- (void)userTextFieldDidChange{
    if (self.userTextField.text.length > 0)
    {
        self.userTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_1"]];
        self.userTextField.leftView = self.userTextFieldImage;
        self.isUserEmpty = NO;
        if (self.passwordTextField.text.length >= 6)
        {
            if (self.userTextField.text.length == 11)
            {
                self.loginButton.titleLabel.alpha = 1;
                [self.loginButton setEnabled:YES];
            }
            else
            {
                self.loginButton.titleLabel.alpha = 0.5;
                [self.loginButton setEnabled:NO];
                [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
                [self.logioningActivityIndicatorView stopAnimating];
            }
        }
    }
    else
    {
        //照片
        self.userTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_11"]];
        self.userTextField.leftView = self.userTextFieldImage;
        self.passwordTextField.text = nil;
        self.passwordTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_12"]];
        self.passwordTextField.leftView = self.passwordTextFieldImage;
        [self.seeButton setImage:[UIImage imageNamed:@"dl_8"] forState:UIControlStateNormal];
        //登录按钮返回初始状态
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.logioningActivityIndicatorView stopAnimating];
        self.loginButton.titleLabel.alpha = 0.5;
        [self.loginButton setEnabled:NO];
        self.isUserEmpty = YES;
        
        
        
        
    }
}

//passwordTextField的监听方法
- (void)passwordTextFieldDidChange{
    if (self.passwordTextField.text.length > 0)
    {
        self.isPasswordEmpty = NO;
        self.passwordTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_6"]];
        self.passwordTextField.leftView = self.passwordTextFieldImage;
        [self.seeButton setImage:[UIImage imageNamed:@"dl_7"] forState:UIControlStateNormal];
        if (self.userTextField.text.length ==11) {
            if (self.passwordTextField.text.length >=6) {
                self.loginButton.titleLabel.alpha = 1;
                [self.loginButton setEnabled:YES];
            }
            else
            {
                self.loginButton.titleLabel.alpha = 0.5;
                [self.loginButton setEnabled:NO];
            }
        }
    }
    else{
        self.isPasswordEmpty = YES;
        self.passwordTextFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_12"]];
        self.passwordTextField.leftView = self.passwordTextFieldImage;
        [self.seeButton setImage:[UIImage imageNamed:@"dl_8"] forState:UIControlStateNormal];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        
        self.loginButton.titleLabel.alpha = 0.5;
        [self.loginButton setEnabled:NO];
        self.passwordTextField.secureTextEntry = YES;
        [self.logioningActivityIndicatorView stopAnimating];
    }
}



//点击界面空白处退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
@end
