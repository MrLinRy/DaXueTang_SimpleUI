//
//  courseDetaViewController.m
//  轻松学
//
//  Created by Mr.Lin on 18/6/25.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "courseDetaViewController.h"
@interface courseDetaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *CourseArry;
@end



@implementation courseDetaViewController
@synthesize CourseArry;
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setTopTitle:@"课程详情"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTopTitleColor:[UIColor whiteColor]];
//#pragma mark--------------电源栏字体颜色
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
//    
//    课程详情
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight, ScreenWidth, ScreenHeight-TopAndSystemHeight) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.scrollEnabled=NO;
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    
    CourseArry =[NSMutableArray arrayWithObjects:@"1B301",@"1-16周",@"周一 1-2节(8:30-10:10)",@"陈雄峰", nil];
    
}



#pragma mark--------tableview相关函数
//区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return CourseArry.count;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LRYScreenpH(120);
    
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LRYScreenpH(70);
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0;
}

//行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"CellID";
    UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    if (CellView == nil)
    {
        
        CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        
        UIImageView *imageHead=[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(40), LRYScreenpH(20), LRYScreenpW(50), LRYScreenpH(50))];
        [imageHead setBackgroundColor:[UIColor clearColor]];
        [imageHead setImage:[UIImage imageNamed:@"sy_17"]];
        [CellView addSubview:imageHead];
        
        NSArray *Arry =[NSMutableArray arrayWithObjects:@"教室",@"周数",@"节数",@"老师", nil];
        
        UILabel *labText=[self createLabel:CGRectMake(CGRectGetMaxX(imageHead.frame)+LRYScreenpW(40), CGRectGetMaxY(imageHead.frame)-LRYScreenpH(50), LRYScreenpW(100), LRYScreenpH(50)) title:Arry[indexPath.row] fontSize:17 textColor:YWQColor(105, 105, 105)];
        [labText setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:labText];
        
        UILabel *labText1=[self createLabel:CGRectMake(CGRectGetMaxX(labText.frame)+LRYScreenpW(30), CGRectGetMaxY(imageHead.frame)-LRYScreenpH(50), LRYScreenpW(400), LRYScreenpH(50)) title:CourseArry[indexPath.row] fontSize:17 textColor:YWQColor(105, 105, 105)];
        [labText1 setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:labText1];
        
        
        UILabel *line=[self createLabel:CGRectMake(LRYScreenpW(40), CellView.frame.size.height-LRYScreenpH(2), ScreenWidth-LRYScreenpW(80), LRYScreenpH(2)) title:nil fontSize:nil textColor:nil];
        [line setBackgroundColor:YWQColor(244, 244, 244)];
        [CellView addSubview:line];
        
        
        [CellView setBackgroundColor:[UIColor clearColor]];
    }
    CellView.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return CellView;
    
}
//区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(100))];
    [headview setBackgroundColor:[UIColor clearColor]];
    UILabel *headLable = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(40), LRYScreenpH(20), ScreenWidth, LRYScreenpH(80))];
    [headLable setText:@"软件工程"];
    [headLable setTextColor:MainColor];
    [headLable setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(21)]];
    headLable.textAlignment = UITextAlignmentLeft;
    [headLable setBackgroundColor:[UIColor whiteColor]];

    [headview addSubview:headLable];

//    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, headLable.frame.size.height, ScreenWidth, LRYScreenpH(1))];
//    [line setBackgroundColor:MainColor];
//    [headview addSubview:line];
    return headview;

}
////区尾视图
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//
//
//    UIView *footview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(50))];
//    [footview setBackgroundColor:[UIColor clearColor]];
//
//    UIButton * appraiseBtn =[self createBtn:CGRectMake(LRYScreenpW(150), LRYScreenpH(120), ScreenWidth-LRYScreenpW(300), LRYScreenpH(80)) title:@"教学评价" iconImage:nil backgroundImage:[UIImage imageNamed:@"圆角矩形-13-拷贝-14"] tag:10000 textColor:[UIColor whiteColor]];
//    [appraiseBtn addTarget:self action:@selector(appraiseClick) forControlEvents:UIControlEventTouchUpInside];
//    [appraiseBtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)]];
//    [footview addSubview:appraiseBtn];
//    return footview;
//}
//

//#pragma mark--------被选中的row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
