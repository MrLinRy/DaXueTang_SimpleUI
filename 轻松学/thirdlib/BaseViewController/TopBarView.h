//
//  TopBarView.h
//  projectBase
//
//  Created by linruyan on 15-9-11.
//  Copyright (c) 2015年 linruyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SizeHeader.h"

@protocol TopBarViewDelegate <NSObject>

@optional
-(void)backActionOfDelegate;

@end

@interface TopBarView : UIView
{
@private
    UIImageView *bgView;
    UIButton *backBtn;
    NSString *titleStr;
    UILabel *titleLab;
}

@property(nonatomic,retain) id<TopBarViewDelegate>delegate;

-(void)setTopTitle:(NSString *)title;
-(void)setTopTitleColor:(UIColor *)color;
-(void)setTopBgColor:(UIColor *)backgroundColor;
-(void)setBackBtnHide:(BOOL)hide;
-(void)onchangeskin;
-(void)setBackBtnImage:(UIImage *)image;
-(void)setTopLineHide:(BOOL)hide;
-(void)setTopTitleFont:(UIFont *)font;

@end
