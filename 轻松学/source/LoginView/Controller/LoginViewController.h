//
//  LoginViewController.h
//  轻松学
//
//  Created by Mr.Lin on 18/5/12.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginView.h"
#import "BasicTextField.h"


@interface LoginViewController : BaseViewController
@property (nonatomic, strong) LoginView *backgroundView;
@property (nonatomic, strong) BasicTextField *userTextField;
@property (nonatomic, strong) BasicTextField *passwordTextField;
@property (nonatomic,strong) UIImageView *userTextFieldImage;
@property (nonatomic,strong) UIImageView *passwordTextFieldImage;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *seeButton;
@property (nonatomic,strong) UIButton *signButton;
@property (nonatomic, strong) UIActivityIndicatorView *logioningActivityIndicatorView;
@property (nonatomic, assign) BOOL isUserEmpty;
@property (nonatomic, assign) BOOL isPasswordEmpty;

@end
