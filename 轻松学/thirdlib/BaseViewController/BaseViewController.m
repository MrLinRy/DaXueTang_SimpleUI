//
//  BaseViewController.m
//  projectBase
//
//  Created by linruyan on 15-9-11.
//  Copyright (c) 2015年 linruyan. All rights reserved.
//

#import "BaseViewController.h"

#define MarginOfBottom  10
#define KeFuBtnTag      838458



@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    //    [self.view insertSubview:kefubtn atIndex:0];
    
}



-(void)setTopTitle:(NSString *)titleStr
{
    [topBarView setTopTitle:titleStr];
}

-(void)setBackBtnHide:(BOOL)hide
{
    [topBarView setBackBtnHide:hide];
}

-(void)initUI
{
    self.view.backgroundColor = TextBgColor;
    topBarView = [[TopBarView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, TopAndSystemHeight)];
    topBarView.delegate = self;
    [self.view addSubview:topBarView];
    
    //    [ViewManager shareInstance].NavigationController.interactivePopGestureRecognizer.enabled = YES;
    //
    //    [[NSNotificationCenter defaultCenter] addObserver: self
    //                                             selector: @selector(skinAction:)
    //                                                 name: Notify_ChangeSkin
    //                                               object: nil];
}

-(void)setBackBtnImage:(UIImage *)image
{
    [topBarView setBackBtnImage:image];
}

-(void)setTopBgColor:(UIColor *)backgroundColor
{
    [topBarView setTopBgColor:backgroundColor];
}

-(void)setTopTitleColor:(UIColor *)color
{
    [topBarView setTopTitleColor:color];
}

-(void)setTopTitleFont:(UIFont *)font
{
    [topBarView setTopTitleFont:font];
}


-(void)setTopLineHide:(BOOL)hide
{
    [topBarView setTopLineHide:hide];
}

-(void)onchangeskin
{
    [topBarView onchangeskin];
}

-(void)skinAction:(id)sender
{
    [self onchangeskin];
}


//创建btn
-(UIButton *)createBtn:(CGRect)frame title:(NSString *)title iconImage:(UIImage *)iconImage backgroundImage:(UIImage *)bgImage tag:(int)tag textColor:(UIColor *)textColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.tag = tag;
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    if(textColor != nil)
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    if(bgImage != nil)
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    if(iconImage != nil)
        [btn setImage:iconImage forState:UIControlStateNormal];
    if(title != nil)
        [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

-(void)btnAction:(UIButton *)btn
{
    
}

//创建label
-(UILabel *)createLabel:(CGRect)frame title:(NSString *)title fontSize:(int)fontSize textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    if(textColor != nil)
        label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}



//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
////    UIButton *kefubtn = [[ [ UIApplication  sharedApplication ]  keyWindow ] viewWithTag:838458];
////    if(kefubtn == nil)
////    {
////        kefubtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        kefubtn.frame = CGRectMake(ScreenWidth-70, ScreenHeight-150, 50, 50);
////        kefubtn.tag = KeFuBtnTag;        [kefubtn setBackgroundImage:[PubFunction GetSkinImage:@"kefu"] forState:UIControlStateNormal];
////        [kefubtn addTarget:self action:@selector(kefuAction:) forControlEvents:UIControlEventTouchUpInside];
////        [ [ [ UIApplication  sharedApplication ]  keyWindow ] addSubview : kefubtn ] ;
////        
////    }
////    else
////    {
////        kefubtn.hidden =NO;
////    }
////    
////    
////}

-(void)backActionOfDelegate
{
    if(self.presentingViewController){
        //modal view controller
        [[ViewManager shareInstance].NavigationController dismissViewControllerAnimated:YES completion:NULL];
        
    }else{
        
        [[ViewManager shareInstance].NavigationController popViewControllerAnimated:YES];
    }
}

@end
