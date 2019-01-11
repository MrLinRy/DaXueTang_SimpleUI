//
//  BasicTextField.m
//  国庆作业
//
//  Created by Mr.Lin on 17/10/1.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "BasicTextField.h"

@implementation BasicTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//重写leftView的值
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 0;
    return iconRect;
}

-(CGRect)rightViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 0;
    return iconRect;
    
}

//  重写占位符的x值
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect placeholderRect = [super placeholderRectForBounds:bounds];
    placeholderRect.origin.x += 0;
    return placeholderRect;
}

//  重写文字输入时的x值
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect editingRect = [super editingRectForBounds:bounds];
    editingRect.origin.x +=21;
    return editingRect;
}

//  重写文字显示时的x值
- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect textRect = [super editingRectForBounds:bounds];
    textRect.origin.x += 21;
    return textRect;
}
@end
