//
//  MyNewsView.m
//  公议
//
//  Created by Mr.Lin on 18/1/2.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "MyNewsView.h"
#import "SizeHeader.h"
#define LEFTSIZE LRYScreenpH(30)
#define HEADIMAGE 1000
#define DATELABE 1001
#define NAMELABE 1002
#define TIMELAB 1003
#define BTN  1004




@implementation MyNewsView



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.backgroundColor=[UIColor clearColor];
        
        
        
        UIImageView *Headimage=[[UIImageView alloc]initWithFrame:CGRectMake(LEFTSIZE, LRYScreenpH(30), LRYScreenpW(80), LRYScreenpH(80))];
        Headimage.tag=HEADIMAGE;
        Headimage.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:Headimage];
        
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(Headimage.frame)+LRYScreenpW(500), CGRectGetMinY(Headimage.frame)+LRYScreenpH(10), LRYScreenpW(100), LRYScreenpH(50))];
        
        btn.tag =BTN;
        [btn setTitle:@"查看" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(12)]];
        [btn.titleLabel setTextColor:[UIColor whiteColor]];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:6];
        [btn setBackgroundColor:MainColor];
        [btn addTarget:self action:@selector(leavewordClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
        UILabel *labDate=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(Headimage.frame)+LEFTSIZE, CGRectGetMinY(Headimage.frame), LRYScreenpW(150), LRYScreenpH(30))];
        labDate.tag =DATELABE;
        labDate.backgroundColor=[UIColor clearColor];
        [labDate setTextColor:YWQColor(175, 175, 175)];
        [labDate setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        labDate.textAlignment=NSTextAlignmentLeft;
        [self addSubview:labDate];
        
        UILabel *labTime=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(labDate.frame)+LRYScreenpW(20), CGRectGetMinY(labDate.frame), LRYScreenpW(180), LRYScreenpH(30))];
        labTime.tag =TIMELAB;
        labTime.backgroundColor=[UIColor clearColor];
        [labTime setTextColor:YWQColor(175, 175, 175)];
        [labTime setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        labTime.textAlignment=NSTextAlignmentLeft;
        [self addSubview:labTime];

        
        UILabel *namelabe=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(labDate.frame), CGRectGetMaxY(labDate.frame)+LRYScreenpH(20), LRYScreenpW(440), LRYScreenpH(30))];
        namelabe.tag =NAMELABE;
        namelabe.backgroundColor=[UIColor clearColor];
        [namelabe setTextColor:YWQColor(175, 175, 175)];
        [namelabe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
        namelabe.textAlignment=NSTextAlignmentLeft;
        [self addSubview:namelabe];

        
        UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(Headimage.frame), CGRectGetMaxY(Headimage.frame)+LRYScreenpH(29), ScreenWidth-2*LEFTSIZE, LRYScreenpH(1))];
        [Line setBackgroundColor:YWQColor(247, 247, 247)];
        [self addSubview:Line];
        
    }
    return self;
}


-(void)setHeadimageText:(NSString *)strHeadimage  DateText:(NSString *)strDate  TimeText:(NSString *)strTime nameText:(NSString *)strname
{
    UIImageView *Headimage=[self viewWithTag:HEADIMAGE];
    [Headimage setImage:[UIImage imageNamed:strHeadimage]];
                            
    UILabel *Date=[self viewWithTag:DATELABE];
    Date.text=strDate;
    
    UILabel * Time=[self viewWithTag:TIMELAB];
    Time.text=strTime;
    
    UILabel *Name=[self viewWithTag:NAMELABE];
    Name.text=strname;
    
}
-(void)setbtntitle:(NSString *)str
{
    UIButton *btn =[self viewWithTag:BTN];
    [btn setTitle:str forState:UIControlStateNormal];
}

//按钮代理行为
-(void)leavewordClick:(UIButton *)sender
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(LeaveWordClick:button:)])
    {
        
        [_delegate LeaveWordClick:self button:sender];
    }
}


@end
