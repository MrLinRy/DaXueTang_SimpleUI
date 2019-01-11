//
//  ForgetViewController.h
//  轻松学
//
//  Created by Mr.Lin on 18/5/12.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "BaseViewController.h"
#import "BasicTextField1.h"
#import "BasicTextField2.h"
@interface ForgetViewController : BaseViewController
@property (nonatomic,strong) UILabel *BackgroundBar;
@property (nonatomic,strong) UILabel *forgetlabel;
@property (nonatomic,strong) UIButton *backbutton;
@property (nonatomic,strong) UIImageView *imagephone;
@property (nonatomic,strong) UIImageView *imageLine1;
@property (nonatomic,strong) UIImageView *imageLine2;
@property (nonatomic,strong) UIImageView *imageLock;
@property (nonatomic,strong) UIImageView *imagefinish;
@property (nonatomic,strong) BasicTextField1 *userTextField;
@property (nonatomic,strong) UIButton *sureButton;
@property (nonatomic,assign) BOOL isValidataEmpty;
@property (nonatomic,assign) BOOL isNewPasswordEmpty;
@property (nonatomic,strong) UIImageView *imagTalk;
@property (nonatomic,strong) UILabel *labelsend;
@property (nonatomic,strong) UILabel *labelphonenumber;
@property (nonatomic,strong) BasicTextField1 *ValidataTextField;
@property (nonatomic,strong) BasicTextField1 *NewPasswordTextField;
@property (nonatomic,strong) UIButton *seeButton;
@property (nonatomic,strong) UIButton *updateButton;
@property (nonatomic,strong) UIButton *ValidataButton;
@property (nonatomic,strong) BasicTextField2 *nameTextField;
@property (nonatomic,strong) BasicTextField2 *schoolValiTextField;
@property (nonatomic,strong) BasicTextField2 *schoolNumber;
@property (nonatomic,strong) UILabel *namelabel;
@property (nonatomic,strong) UILabel *schoolValilabel;
@property (nonatomic,strong) UILabel *schoollabel;
@property (nonatomic,strong) UILabel *schoolNumberlabel;
@property (nonatomic,strong) UIButton *getValibutton;
@property (nonatomic,strong) UIButton *finishButton;
@property (nonatomic,assign) BOOL isschoolValiEmpty;
@property (nonatomic,assign) BOOL isnameEmpty;
@property (nonatomic,strong) UIView *alertbackgroundView;
@property (nonatomic,strong) UIView *viewAlert;
@property (nonatomic,strong) UIButton *cancelAlertbtn;
@property (nonatomic,strong) UIButton *sureAlertbtn;
@property (nonatomic,strong) UILabel *alerttoplabel;
@property (nonatomic,strong) UITextView *alertbotTextView;

@end
