//
//  LoginView.m
//  国庆作业
//
//  Created by Mr.Lin on 17/10/1.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "LoginView.h"
#define LRYScreenpW(ww)  ww*([[UIScreen mainScreen] bounds].size.width)/750
#define LRYScreenpH(hh)  hh*([[UIScreen mainScreen] bounds].size.height)/1334
#define LRYUIColorFromRGB(rgbValue,a) [UIColor colorWithRed:(((rgbValue & 0xFF0000 ) >>16))/255.0 green:(((rgbValue & 0x00FF00) >>8))/255.0 blue:((rgbValue & 0x0000FF))/255.0 alpha:a]

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect
{
    //横线
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(context1, 1.0);
    CGContextSetAllowsAntialiasing(context1, YES);
    CGContextSetRGBStrokeColor(context1, 185,193,214,1.0);
    CGContextBeginPath(context1);
    
    CGContextMoveToPoint(context1,LRYScreenpW(644), LRYScreenpH(95));
    CGContextAddLineToPoint(context1, LRYScreenpW(0), LRYScreenpH(95));
    [LRYUIColorFromRGB(0xb9c1d6, 1.0)setStroke];
    CGContextStrokePath(context1);
    
    
    //横线
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(context2, 1.0);
    CGContextSetAllowsAntialiasing(context2, YES);
    CGContextSetRGBStrokeColor(context2, 185,193,214,1.0);
    CGContextBeginPath(context2);
    
    CGContextMoveToPoint(context2,LRYScreenpW(644), LRYScreenpH(210));
    CGContextAddLineToPoint(context2, LRYScreenpW(0), LRYScreenpH(208));
    [LRYUIColorFromRGB(0xb9c1d6, 1.0)setStroke];
    CGContextStrokePath(context2);

    

}




@end
