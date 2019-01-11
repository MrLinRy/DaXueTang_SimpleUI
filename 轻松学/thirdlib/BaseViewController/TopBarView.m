//
//  TopBarView.m
//  projectBase
//
//  Created by linruayn on 14-9-11.
//  Copyright (c) 2015年 linruyan. All rights reserved.
//

#import "TopBarView.h"

#define TitleLabWidth  150
#define LINE           151

@implementation TopBarView

-(void)onchangeskin
{
    bgView.backgroundColor = MainColor;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopAndSystemHeight)];
        bgView.userInteractionEnabled = YES;
        bgView.backgroundColor = MainColor;
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, bgView.frame.size.height-37, 50, 34);
        [backBtn setImage:[UIImage imageNamed:@"sy_12"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:backBtn];
        
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, bgView.frame.size.height-30, ScreenWidth-100, 20)];
        titleLab.textColor = [UIColor blackColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.font = [UIFont systemFontOfSize:17.0];
        [bgView addSubview:titleLab];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, bgView.frame.size.height-1, ScreenWidth, 1)];
        line.tag = LINE;
        line.alpha = .4;
        line.backgroundColor = UIColorRGB(220);
        [bgView addSubview:line];
        
        [self addSubview:bgView];
        
        
        
    }
    return self;
}

-(void)btnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(backActionOfDelegate)])
    {
        [_delegate backActionOfDelegate];
    }
}

-(void)setTopTitle:(NSString *)title
{
    titleLab.text = title;
}

-(void)setTopTitleColor:(UIColor *)color
{
    titleLab.textColor = color;
}

-(void)setTopTitleFont:(UIFont *)font
{
    [titleLab setFont:font];
}

-(void)setBackBtnHide:(BOOL)hide
{
    backBtn.hidden  = hide;
}

-(void)setTopBgColor:(UIColor *)backgroundColor
{
    bgView.backgroundColor = backgroundColor;
}

-(void)setBackBtnImage:(UIImage *)image
{
    [backBtn setImage:image forState:UIControlStateNormal];
}

-(void)setTopLineHide:(BOOL)hide
{
    UIView *line = [self viewWithTag:LINE];
    line.hidden = hide;
}
@end
