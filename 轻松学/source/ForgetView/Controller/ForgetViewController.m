//
//  ForgetViewController.m
//  轻松学
//
//  Created by Mr.Lin on 18/5/12.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "ForgetViewController.h"
#import "SizeHeader.h"
#import "ViewManager.h"
@interface ForgetViewController ()
{
    int t;
    NSTimer *timer;
}
@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    [self.view setBackgroundColor:YWQColor(246, 246, 246)];
    [self setTopBgColor:[UIColor whiteColor]];
    
    [self setBackBtnHide:YES];
//    标题
    [self setTopTitle:@"忘记密码"];
    [self setTopTitleFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    [self setTopTitleColor:LRYUIColorFromRGB(0x000000, 1.0)];
    
    
    [self addBackgroundView:[[UIScreen mainScreen] bounds]];
    [self  addAllButtons:[[UIScreen mainScreen] bounds]];
    [self UserTextField:[[UIScreen mainScreen] bounds]];
//    [self  setswipe:[[UIScreen mainScreen] bounds]];
    
    
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
-(void)drawRect:(CGRect)rect
{
    //横线
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(context3, 1.0);
    CGContextSetAllowsAntialiasing(context3, YES);
    CGContextSetRGBStrokeColor(context3, 185,193,214,1.0);
    CGContextBeginPath(context3);
    
    CGContextMoveToPoint(context3,LRYScreenpW(0), LRYScreenpH(131));
    CGContextAddLineToPoint(context3, LRYScreenpW(750), LRYScreenpH(131));
    [LRYUIColorFromRGB(0xb9c1d6, 1.0)setStroke];
    CGContextStrokePath(context3);
    
}

#pragma mask--------------------背景
-(void)addBackgroundView:(CGRect)frame
{
    //手机
    self.imagephone = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(55), LRYScreenpH(167), LRYScreenpW(45), LRYScreenpH(52))];
    [self.imagephone setImage:[UIImage imageNamed:@"dl_1"]];
    self.imagephone.contentMode = UIViewContentModeScaleAspectFit;//保真
    [self.view addSubview:self.imagephone];
    //过渡线  可以用句号用和label做
    self.imageLine1 = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(110), LRYScreenpH(190), LRYScreenpW(220), LRYScreenpH(7))];
    [self.imageLine1 setImage:[UIImage imageNamed:@"椭圆-4-拷贝-9"]];
    self.imageLine2 = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(410), LRYScreenpH(190), LRYScreenpW(220), LRYScreenpH(7))];
    [self.imageLine2 setImage:[UIImage imageNamed:@"椭圆-4-拷贝-9"]];
    
    [self.view addSubview:self.imageLine1];
    
    [self.view addSubview:self.imageLine2];
    
    //锁头
    self.imageLock = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(350), LRYScreenpH(167), LRYScreenpW(45), LRYScreenpH(52))];
    [self.imageLock setImage:[UIImage imageNamed:@"dl_2"]];
    self.imageLock.contentMode = UIViewContentModeScaleAspectFit;//保真
    [self.view addSubview:self.imageLock];
    
    //完成
    self.imagefinish = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(655), LRYScreenpH(167), LRYScreenpW(45), LRYScreenpH(60))];
    [self.imagefinish setImage:[UIImage imageNamed:@"dl_10"]];
    self.imagefinish.contentMode = UIViewContentModeScaleAspectFit;//保真
    [self.view addSubview:self.imagefinish];
    
}
#pragma mask------------------输入框
-(void)UserTextField:(CGRect)frame
{
    self.userTextField = [[BasicTextField1 alloc]initWithFrame:CGRectMake(0, LRYScreenpH(250), LRYScreenpW(750), LRYScreenpH(101))];
    self.userTextField.backgroundColor = [UIColor whiteColor];
    self.userTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.userTextField.delegate = self;
    self.userTextField.tag = 1000002;
    self.userTextField.placeholder = @"请输入手机号";
    [self.userTextField setValue:LRYUIColorFromRGB(0xb9c1d6, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.userTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.userTextField.clearButtonMode = UITextFieldViewModeAlways;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.userTextField];
    self.userTextField.clearsOnBeginEditing = YES;
    [self.view addSubview:self.userTextField];
    
}


#pragma mask-------------------按钮
-(void)addAllButtons:(CGRect)frame
{
    
    //back按钮
    self.backbutton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(29), LRYScreenpH(60), LRYScreenpW(23), LRYScreenpH(38))];
    UIImage *imageback = [UIImage imageNamed:@"返回-5-拷贝-17"];
    [self.backbutton setImage:imageback forState:UIControlStateNormal];
    [self.backbutton addTarget:self action:@selector(BackTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backbutton];
    //确定按钮
    self.sureButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(60), LRYScreenpH(415), LRYScreenpW(629), LRYScreenpH(79))];
    [self.sureButton setTitle:@"确认" forState:UIControlStateNormal];
    [self.sureButton setTitleColor:LRYUIColorFromRGB(0xffffff, 0.5) forState:UIControlStateReserved];
    [self.sureButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(18.5)]];
    self.sureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.sureButton setBackgroundImage:[UIImage imageNamed:@"圆角矩形-13-拷贝-14"] forState:UIControlStateNormal];
    self.sureButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.sureButton setEnabled:NO];
    [self.sureButton addTarget:self action:@selector(SureTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sureButton];
}


-(void)BackTap:(UIButton *)sender
{
    //返回
    [self dismissModalViewControllerAnimated:YES];
    
}
//监听
-(void)userTextFieldDidChange
{
    if (self.userTextField.text.length > 0)
    {
        if (self.userTextField.text.length == 11) {
            self.sureButton.titleLabel.alpha = 1;
            [self.sureButton setEnabled:YES];
            
        }
        else
        {
            self.sureButton.titleLabel.alpha = 0.5;
            [self.sureButton setEnabled:NO];
        }
    }
    else
    {
        self.sureButton.titleLabel.alpha = 0.5;
        [self.sureButton setEnabled:NO];
    }
    
}
#pragma mask-----------------确定按钮
-(void)SureTap:(UIButton *)sender
{
    //移除第一面控件界面
    [self.userTextField removeFromSuperview];
    [self.sureButton removeFromSuperview];
    
    //出现第二面控件界面
    [self.imageLine1 setImage:[UIImage imageNamed:@"椭圆-4-拷贝-10"]];
    [self.imageLock setImage:[UIImage imageNamed:@"dl_6"]];
    //对话框
    self.imagTalk = [[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(55), LRYScreenpH(225), LRYScreenpW(402), LRYScreenpH(104))];
    [self.imagTalk setImage:[UIImage imageNamed:@"dl_5"]];
    self.imagTalk.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imagTalk];
    
    self.labelsend = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(80), LRYScreenpH(266), LRYScreenpW(155), LRYScreenpH(25))];
    self.labelsend.text = @"验证码已发送到";
    [self.labelsend setTextColor:LRYUIColorFromRGB(0x00aeff, 1.0)];
    self.labelsend.textAlignment = NSTextAlignmentLeft;
    [self.labelsend setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
    self.labelsend.userInteractionEnabled = NO;
    [self.view addSubview:self.labelsend];
    
    self.labelphonenumber = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(245), LRYScreenpH(266), LRYScreenpW(190), LRYScreenpH(25))];
    self.labelphonenumber.userInteractionEnabled = NO;
    self.labelphonenumber.text = self.userTextField.text;
    [self.labelphonenumber setTextColor:LRYUIColorFromRGB(0x323232, 1.0)];
    self.labelphonenumber.textAlignment = NSTextAlignmentLeft;
    [self.labelphonenumber setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
    [self.view addSubview:self.labelphonenumber];
    //验证码框
    self.ValidataTextField = [[BasicTextField1 alloc]initWithFrame:CGRectMake(0, LRYScreenpH(340), LRYScreenpW(750), LRYScreenpH(100))];
    self.ValidataTextField.backgroundColor = [UIColor whiteColor];
    self.ValidataTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.ValidataTextField.delegate = self;
    self.ValidataTextField.tag = 1000003;
    self.ValidataTextField.placeholder = @"请输入验证码";
    [self.ValidataTextField setValue:LRYUIColorFromRGB(0xc1c1c1, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.ValidataTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.ValidataTextField.textAlignment = NSTextAlignmentLeft;
    //self.ValidataTextField.clearButtonMode = UITextFieldViewModeAlways;
    //self.ValidataTextField.clearsOnBeginEditing = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ValidataTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.ValidataTextField];
    
    [self.view addSubview:self.ValidataTextField];
    //新密码输入框
    self.NewPasswordTextField = [[BasicTextField1 alloc]initWithFrame:CGRectMake(0, LRYScreenpH(442), LRYScreenpW(750), LRYScreenpH(100))];
    self.NewPasswordTextField.backgroundColor = [UIColor whiteColor];
    self.NewPasswordTextField.keyboardType = UIKeyboardTypeDefault;
    self.NewPasswordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.NewPasswordTextField.delegate = self;
    self.NewPasswordTextField.tag = 1000004;
    self.NewPasswordTextField.placeholder = @"请输入新密码";
    [self.NewPasswordTextField setValue:LRYUIColorFromRGB(0xc1c1c1, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.NewPasswordTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.NewPasswordTextField.textAlignment = NSTextAlignmentLeft;
    //self.NewPasswordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NewPasswordTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.NewPasswordTextField];
    //self.NewPasswordTextField.clearsOnBeginEditing = YES;
    self.NewPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:self.NewPasswordTextField];
    //可见密码按钮
    self.seeButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(665), LRYScreenpH(476), LRYScreenpW(36), LRYScreenpH(46))];
    self.seeButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.seeButton setImage:[UIImage imageNamed:@"dl_8"] forState:UIControlStateNormal];
    [self.seeButton addTarget:self action:@selector(SeeTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.seeButton];
    //修改密码的按钮
    self.updateButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(60), LRYScreenpH(620), LRYScreenpW(629), LRYScreenpH(79))];
    [self.updateButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [self.updateButton setTitleColor:LRYUIColorFromRGB(0xffffff, 0.5) forState:UIControlStateReserved];
    [self.updateButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(18.5)]];
    self.updateButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.updateButton setBackgroundImage:[UIImage imageNamed:@"圆角矩形-13-拷贝-14"] forState:UIControlStateNormal];
    self.updateButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.updateButton setEnabled:NO];
    [self.updateButton addTarget:self action:@selector(UpdateTap:) forControlEvents:UIControlEventTouchUpInside];
    self.isNewPasswordEmpty = YES;
    [self.view addSubview:self.updateButton];
    //验证码按钮
    self.ValidataButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(500), LRYScreenpH(360), LRYScreenpW(199), LRYScreenpH(63))];
    
    [self.ValidataButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.ValidataButton setTitleColor:LRYUIColorFromRGB(0x4faf2a, 0.5) forState:UIControlStateNormal];
    self.ValidataButton.userInteractionEnabled = YES;
    [self.ValidataButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
    [self.ValidataButton.layer setCornerRadius:6.0]; //设置矩圆角半径
    [self.ValidataButton.layer setBorderWidth:1.0];   //边框宽度
    [self.ValidataButton.layer setMasksToBounds:YES];
    [self.ValidataButton.layer setBorderColor:LRYUIColorFromRGB(0x4faf2a, 0.5).CGColor];
    [self.ValidataButton addTarget:self action:@selector(ValidataBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.ValidataButton];
    
}
//验证码按钮事件
-(void)ValidataBtnClick
{
    t=119;
    NSString *strtime = [[NSString alloc]init];
    strtime =[NSString  stringWithFormat:@"%ds",t];
    [self.ValidataButton setTitle:strtime forState:UIControlStateNormal];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action:) userInfo:nil repeats:YES];
    
}
#pragma mark------验证码计时器事件
-(void)action:(UIButton *)sender
{
    t--;
    NSString *strtime = [[NSString alloc]init];
    strtime =[NSString  stringWithFormat:@"%ds",t];
    [self.ValidataButton setTitle:strtime forState:UIControlStateNormal];
    if(t==0){
        [timer invalidate];
        NSLog(@"   stop");
        [self.ValidataButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    }
}

-(void)ValidataTextFieldDidChange
{
    if (self.ValidataTextField.text.length > 0)
    {
        if (self.ValidataTextField.text.length == 6)
        {
            self.isValidataEmpty = NO;
            if (self.NewPasswordTextField.text.length >= 6)
            {
                self.updateButton.titleLabel.alpha = 1;
                [self.updateButton setEnabled:YES];
            }
            else
            {
                self.updateButton.titleLabel.alpha = 0.5;
                [self.updateButton setEnabled:NO];
                
            }
        }
        else
        {
            self.updateButton.titleLabel.alpha = 0.5;
            [self.updateButton setEnabled:NO];
            
        }
    }
    else
    {
        self.isValidataEmpty = YES;
        self.updateButton.titleLabel.alpha = 0.5;
        [self.updateButton setEnabled:NO];
        
    }
    
}
-(void)NewPasswordTextFieldDidChange
{
    if (self.NewPasswordTextField.text.length >0)
    {
        self.isNewPasswordEmpty = NO;
        [self.seeButton setImage:[UIImage imageNamed:@"dl_7"] forState:UIControlStateNormal];
        
        if (self.ValidataTextField.text.length == 6)
        {
            if (self.NewPasswordTextField.text.length >= 6)
            {
                self.updateButton.titleLabel.alpha = 1;
                [self.updateButton setEnabled:YES];
            }
            
        }
        else
        {
            self.updateButton.titleLabel.alpha = 0.5;
            [self.updateButton setEnabled:NO];
        }
    }
    else{
        self.isNewPasswordEmpty = YES;
        [self.seeButton setImage:[UIImage imageNamed:@"dl_6"] forState:UIControlStateNormal];
        self.updateButton.titleLabel.alpha = 0.5;
        [self.updateButton setEnabled:NO];
        self.NewPasswordTextField.secureTextEntry = YES;
    }
    
}
-(void)SeeTap:(UIButton *)sender
{
    if (self.NewPasswordTextField.secureTextEntry == NO)
    {
        self.NewPasswordTextField.secureTextEntry = YES;
    }
    else
    {
        self.NewPasswordTextField.secureTextEntry = NO;
        
    }
}

-(void)UpdateTap:(UIButton *)sender
{
    [self.labelphonenumber removeFromSuperview];
    [self.ValidataTextField removeFromSuperview];
    [self.ValidataButton removeFromSuperview];
    [self.NewPasswordTextField removeFromSuperview];
    [self.seeButton removeFromSuperview];
    [self.updateButton removeFromSuperview];
    [self.imagTalk removeFromSuperview];
    [self.labelsend removeFromSuperview];
    
    [self.imageLine2 setImage:[UIImage imageNamed:@"椭圆-4-拷贝-10"]];
    [self.imagefinish setImage:[UIImage imageNamed:@"dl_9"]];
    //输入框
    self.nameTextField = [[BasicTextField2 alloc]initWithFrame:CGRectMake(LRYScreenpW(114), LRYScreenpH(255), LRYScreenpW(635), LRYScreenpH(100))];
    self.nameTextField.backgroundColor = [UIColor whiteColor];
    self.nameTextField.keyboardType = UIKeyboardTypeDefault;
    self.nameTextField.delegate = self;
    self.nameTextField.tag = 1000004;
    self.nameTextField.placeholder = @"请输入姓名";
    [self.nameTextField setValue:LRYUIColorFromRGB(0xc1c1c1, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.nameTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.nameTextField.textAlignment = NSTextAlignmentRight;
    //self.nameTextField.clearButtonMode = UITextFieldViewModeAlways;
    //self.nameTextField.clearsOnBeginEditing = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nameTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.nameTextField];
    [self.view addSubview:self.nameTextField];
    
    
//    学号
    self.schoolNumber= [[BasicTextField2 alloc]initWithFrame:CGRectMake(LRYScreenpW(114), LRYScreenpH(357), LRYScreenpW(635), LRYScreenpH(100))];
    self.schoolNumber.backgroundColor = [UIColor whiteColor];
    self.schoolNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.schoolNumber.delegate = self;
    self.schoolNumber.tag = 1000006;
    self.schoolNumber.placeholder = @"请输入学号";
    [self.schoolNumber setValue:LRYUIColorFromRGB(0xc1c1c1, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.schoolNumber setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.schoolNumber.textAlignment = NSTextAlignmentRight;
    //self.schoolNumber.clearButtonMode = UITextFieldViewModeAlways;
    //self.schoolNumber.clearsOnBeginEditing = YES;
//    self.isschoolValiEmpty = YES;
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(schoolValiTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.schoolValiTextField];
    [self.view addSubview:self.schoolNumber];

    
    //高校验证码
    self.schoolValiTextField = [[BasicTextField2 alloc]initWithFrame:CGRectMake(LRYScreenpW(199), CGRectGetMaxY(self.schoolNumber.frame)+LRYScreenpH(35), LRYScreenpW(550), LRYScreenpH(100))];
    self.schoolValiTextField.backgroundColor = [UIColor whiteColor];
    self.schoolValiTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.schoolValiTextField.delegate = self;
    self.schoolValiTextField.tag = 1000005;
    self.schoolValiTextField.placeholder = @"请输入学校邀请码";
    [self.schoolValiTextField setValue:LRYUIColorFromRGB(0xc1c1c1, 1.0) forKeyPath:@"_placeholderLabel.textColor"];//颜色
    [self.schoolValiTextField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.schoolValiTextField.textAlignment = NSTextAlignmentRight;
    //self.schoolValiTextField.clearButtonMode = UITextFieldViewModeAlways;
    //self.schoolValiTextField.clearsOnBeginEditing = YES;
    self.isschoolValiEmpty = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(schoolValiTextFieldDidChange) name:UITextFieldTextDidChangeNotification object:self.schoolValiTextField];
    [self.view addSubview:self.schoolValiTextField];
    //namelabel、schoolValilabel
    self.namelabel = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(0), LRYScreenpH(255), LRYScreenpW(115), LRYScreenpH(100))];
    self.namelabel.text = @"姓名";
    [self.namelabel setTextColor:[UIColor blackColor]];
    self.namelabel.backgroundColor = [UIColor whiteColor];
    [self.namelabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.namelabel.textAlignment = NSTextAlignmentRight;
    self.namelabel.userInteractionEnabled = NO;
    [self.view addSubview:self.namelabel];
    
    self.schoolNumberlabel = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(0), CGRectGetMinY(self.schoolNumber.frame), LRYScreenpW(115), LRYScreenpH(100))];
    self.schoolNumberlabel.text = @"学号";
    [self.schoolNumberlabel setTextColor:[UIColor blackColor]];
    self.schoolNumberlabel.backgroundColor = [UIColor whiteColor];
    [self.schoolNumberlabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.schoolNumberlabel.textAlignment = NSTextAlignmentRight;
    self.schoolNumberlabel.userInteractionEnabled = NO;
    [self.view addSubview:self.schoolNumberlabel];
    
    self.schoolValilabel = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(0), CGRectGetMaxY(self.schoolNumber.frame)+LRYScreenpH(35), LRYScreenpW(200), LRYScreenpH(100))];
    self.schoolValilabel.text = @"学校邀请码";
    [self.schoolValilabel setTextColor:[UIColor blackColor]];
    self.schoolValilabel.backgroundColor = [UIColor whiteColor];
    [self.schoolValilabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    self.schoolValilabel.textAlignment = NSTextAlignmentRight;
    self.schoolValilabel.userInteractionEnabled = NO;
    [self.view addSubview:self.schoolValilabel];
    
    //schoolLabel
    self.schoollabel = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(335), CGRectGetMaxY(self.schoolValilabel.frame)+LRYScreenpH(28), LRYScreenpW(160), LRYScreenpH(30))];
    self.schoollabel.text = @"学校未开通 ？";
    [self.schoollabel setTextColor:LRYUIColorFromRGB(0x535353, 1.0)];
    [self.schoollabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
    self.schoollabel.textAlignment = NSTextAlignmentCenter;
    self.schoollabel.userInteractionEnabled = NO;
    [self.view addSubview:self.schoollabel];
    
    //getValiButton
    self.getValibutton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(493), CGRectGetMaxY(self.schoolValilabel.frame)+LRYScreenpH(28), LRYScreenpW(230), LRYScreenpH(30))];
    [self.getValibutton setTitle:@"获取试用邀请码 " forState:UIControlStateNormal];
    [self.getValibutton setTitleColor:LRYUIColorFromRGB(0xff0000, 1.0) forState:UIControlStateNormal];
    [self.getValibutton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(14)]];
    self.getValibutton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.getValibutton setImage:[UIImage imageNamed:@"更多-11"] forState:UIControlStateNormal];
    [self.getValibutton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.getValibutton.imageView.bounds.size.width, 0, self.getValibutton.imageView.bounds.size.width)];
    [self.getValibutton setImageEdgeInsets:UIEdgeInsetsMake(0, self.getValibutton.titleLabel.bounds.size.width, 0, -self.getValibutton.titleLabel.bounds.size.width)];
    self.getValibutton.contentMode = UIViewContentModeScaleAspectFit;
    [self.getValibutton setEnabled:YES];
    [self.getValibutton addTarget:self action:@selector(getValidataTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.getValibutton];
    //完成修改按钮
    self.finishButton = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(60), CGRectGetMaxY(self.schoolValilabel.frame)+LRYScreenpH(110), LRYScreenpW(629), LRYScreenpH(79))];
    [self.finishButton setTitle:@"完成修改" forState:UIControlStateNormal];
    [self.finishButton setTitleColor:LRYUIColorFromRGB(0xffffff, 0.5) forState:UIControlStateReserved];
    [self.finishButton.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(18.5)]];
    self.finishButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.finishButton setBackgroundImage:[UIImage imageNamed:@"圆角矩形-13-拷贝-14"] forState:UIControlStateNormal];
    self.finishButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.finishButton setEnabled:NO];
    [self.finishButton addTarget:self action:@selector(finishTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.finishButton];
}

-(void)nameTextFieldDidChange
{
    if (self.nameTextField.text.length > 0)
    {
        self.isnameEmpty = NO;
        if (self.isschoolValiEmpty == NO)
        {
            self.finishButton.titleLabel.alpha = 1;
            [self.finishButton setEnabled:YES];
        }
    }
    else
    {
        self.isnameEmpty = YES;
        self.finishButton.titleLabel.alpha = 0.5;
        [self.finishButton setEnabled:NO];
    }
    
}

-(void)schoolValiTextFieldDidChange
{
    if (self.schoolValiTextField.text.length == 6)
    {
        self.isschoolValiEmpty = NO;
        if (self.isnameEmpty == NO)
        {
            self.finishButton.titleLabel.alpha = 1;
            [self.finishButton setEnabled:YES];
        }
    }
    else
    {
        self.isschoolValiEmpty = YES;
        self.finishButton.titleLabel.alpha = 0.5;
        [self.finishButton setEnabled:NO];
    }
    
}



-(void)getValidataTap:(UIButton *)sender
{
    [self.nameTextField resignFirstResponder];
    [self.schoolValiTextField resignFirstResponder];
    //    ProvinceView *ProvinView = [[ProvinceView alloc]initWithFrame:CGRectMake(0, 0, LRYScreenpW(750), LRYScreenpH(1334))];
    //    [self addSubview:ProvinView];
}

-(void)finishTap:(UIButton *)sender
{
    [self.schoolValiTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.backbutton removeFromSuperview];
    //半透明背景
    self.alertbackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, LRYScreenpH(130), LRYScreenpW(750), LRYScreenpH(1204))];
    self.alertbackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.view addSubview:self.alertbackgroundView];
    //警告框
    self.viewAlert = [[UIView alloc]initWithFrame:CGRectMake(LRYScreenpW(70), LRYScreenpH(220), LRYScreenpW(600), LRYScreenpH(435))];
    self.viewAlert.backgroundColor = [UIColor whiteColor];
    [self.alertbackgroundView addSubview:self.viewAlert];
    //取消按钮、确认按钮
    self.cancelAlertbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, LRYScreenpH(345), LRYScreenpW(300), LRYScreenpH(90))];
    [self.cancelAlertbtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelAlertbtn setTitleColor:LRYUIColorFromRGB(0x00aeff, 1.0) forState:UIControlStateNormal];
    [self.cancelAlertbtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
    self.cancelAlertbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.cancelAlertbtn.backgroundColor = LRYUIColorFromRGB(0xedf9ff, 1.0);
    [self.cancelAlertbtn addTarget:self action:@selector(cancelAlertbtnTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewAlert addSubview:self.cancelAlertbtn];
    
    self.sureAlertbtn = [[UIButton alloc]initWithFrame:CGRectMake(LRYScreenpW(301), LRYScreenpH(345), LRYScreenpW(300), LRYScreenpH(90))];
    [self.sureAlertbtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.sureAlertbtn setTitleColor:LRYUIColorFromRGB(0xffffff, 1.0) forState:UIControlStateNormal];
    [self.sureAlertbtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
    self.sureAlertbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.sureAlertbtn.backgroundColor = LRYUIColorFromRGB(0x00aeff, 1.0);
    [self.sureAlertbtn addTarget:self action:@selector(sureAlertbtnTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewAlert addSubview:self.sureAlertbtn];
    //信息
    self.alerttoplabel = [[UILabel alloc]initWithFrame:CGRectMake(0, LRYScreenpH(30), LRYScreenpW(240), LRYScreenpH(30))];
    self.alerttoplabel.text = @"      确认修改密码";
    [self.alerttoplabel setTextColor:LRYUIColorFromRGB(0x666666, 1.0)];
    [self.alerttoplabel setUserInteractionEnabled:NO];
    [self.alerttoplabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    [self.viewAlert addSubview:self.alerttoplabel];
    
    self. alertbotTextView= [[UITextView alloc]initWithFrame:CGRectMake(LRYScreenpW(60), LRYScreenpH(130), LRYScreenpW(480), LRYScreenpH(100))];
    self.alertbotTextView.text = @"      您的密码将被修改，是否确认修改为当前密码";
    [self.alertbotTextView setTextColor:LRYUIColorFromRGB(0x666666, 1.0)];
    [self.alertbotTextView setUserInteractionEnabled:NO];
    [self.alertbotTextView setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(16)]];
    [self.viewAlert addSubview:self.alertbotTextView];
}

-(void)cancelAlertbtnTap:(UIButton *)sender
{
    [self.cancelAlertbtn removeFromSuperview];
    [self.sureAlertbtn removeFromSuperview];
    [self.viewAlert removeFromSuperview];
    [self.alertbackgroundView removeFromSuperview];
    [self.view addSubview:self.backbutton];
}


-(void)sureAlertbtnTap:(UIButton *)sender
{
    
    //返回
    [self dismissModalViewControllerAnimated:YES];
    
}
//-(void)setswipe:(CGRect)frame
//{
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]init];
//    swipe.direction = UISwipeGestureRecognizerDirectionRight;
//    [swipe addTarget:self action:@selector(setswipeaction)];
//    [self.view addGestureRecognizer:swipe];
//}
-(void)setswipeaction
{
    [self.view removeFromSuperview];
}
//点击界面空白处退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userTextField resignFirstResponder];
    [self.ValidataTextField resignFirstResponder];
    [self.NewPasswordTextField resignFirstResponder];
    [self.schoolValiTextField resignFirstResponder];
    [self.NewPasswordTextField resignFirstResponder];
}


@end
