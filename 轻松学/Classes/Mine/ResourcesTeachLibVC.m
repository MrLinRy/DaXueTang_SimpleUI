//
//  ResourcesLibVC.m
//  轻松学
//
//  Created by Mr.Lin on 18/6/26.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "ResourcesTeachLibVC.h"
#import "CourseResources.h"
#import "ChatVController.h"

@interface ResourcesTeachLibVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *CourseArry;
@end

@implementation ResourcesTeachLibVC
@synthesize CourseArry;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTopTitle:@"课程老师"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTopTitleColor:[UIColor whiteColor]];
#pragma mark--------------电源栏字体颜色
    //    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    //   课程
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight, ScreenWidth, ScreenHeight-TopAndSystemHeight) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    //tableView.scrollEnabled=NO;
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    
    CourseResources *courese0=[[CourseResources alloc]init];
    [courese0 setNameStr:@"软件工程"];
    [courese0 setTeachnameStr:@"陈老师"];
    [courese0 setHeadimageStr:@"sy_39"];
    
    CourseResources *courese1=[[CourseResources alloc]init];
    [courese1 setNameStr:@"马克思主义基本原理"];
    [courese1 setTeachnameStr:@"顾老师"];
    [courese1 setHeadimageStr:@"sy_11"];
    
    CourseResources *courese2=[[CourseResources alloc]init];
    [courese2 setNameStr:@"面向对象程序设计(Java)"];
    [courese2 setTeachnameStr:@"余老师"];
    [courese2 setHeadimageStr:@"sy_42"];
    
    CourseResources *courese3=[[CourseResources alloc]init];
    [courese3 setNameStr:@"工程经济学"];
    [courese3 setTeachnameStr:@"李老师"];
    [courese3 setHeadimageStr:@"sy_17"];
    
    CourseResources *courese4=[[CourseResources alloc]init];
    [courese4 setNameStr:@"概率统计"];
    [courese4 setTeachnameStr:@"任老师"];
    [courese4 setHeadimageStr:@"sy_25"];
    
    CourseResources *courese5=[[CourseResources alloc]init];
    [courese5 setNameStr:@"大学体育"];
    [courese5 setTeachnameStr:@"周老师"];
    [courese5 setHeadimageStr:@"sy_26"];
    
    CourseResources *courese6=[[CourseResources alloc]init];
    [courese6 setNameStr:@"毛泽东思想和中国特色社会主义原理"];
    [courese6 setTeachnameStr:@"林老师"];
    [courese6 setHeadimageStr:@"sy_33"];
    
    
    CourseArry =[NSMutableArray arrayWithObjects:courese0,courese1,courese2,courese3,courese4,courese5,courese6, nil];
    
    
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
    return LRYScreenpH(50);
    
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LRYScreenpH(100);
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
        
        CourseResources *courese=[[CourseResources alloc]init];
        courese=CourseArry[indexPath.row];
        
        
        
        UIImageView *imageHead=[[UIImageView alloc]initWithFrame:CGRectMake(LRYScreenpW(40), LRYScreenpH(20), LRYScreenpW(80), LRYScreenpH(80))];
        [imageHead setBackgroundColor:[UIColor clearColor]];
        [imageHead setImage:[UIImage imageNamed:courese.headimageStr]];
        [CellView addSubview:imageHead];
        
        
        UILabel *labText=[self createLabel:CGRectMake(CGRectGetMaxX(imageHead.frame)+LRYScreenpW(30), LRYScreenpH(20), LRYScreenpW(600), LRYScreenpH(50)) title:courese.TeachnameStr fontSize:18 textColor:YWQColor(105, 105, 105)];
        [labText setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:labText];
        
        
        UILabel *nameText=[self createLabel:CGRectMake(CGRectGetMaxX(imageHead.frame)+LRYScreenpW(30), CGRectGetMaxY(labText.frame)+LRYScreenpH(10), LRYScreenpW(600), LRYScreenpH(20)) title:courese.nameStr fontSize:15 textColor:YWQColor(105, 105, 105)];
        nameText.alpha=0.5;
        [nameText setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:nameText];
        
        
        UILabel *line=[self createLabel:CGRectMake(LRYScreenpW(40), CGRectGetMaxY(imageHead.frame)+LRYScreenpH(15), ScreenWidth-LRYScreenpW(80), LRYScreenpH(2)) title:nil fontSize:nil textColor:nil];
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
    UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(50))];
    [headview setBackgroundColor:[UIColor clearColor]];
    UILabel *headLable =[self createLabel:CGRectMake(LRYScreenpW(20), LRYScreenpH(5), ScreenWidth, LRYScreenpH(50)) title:@"2017-2018年第二学期" fontSize:13 textColor:MainColor];
    headLable.textAlignment = UITextAlignmentCenter;
    [headLable setBackgroundColor:[UIColor whiteColor]];
    
    [headview addSubview:headLable];
    
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, headLable.frame.size.height, ScreenWidth, LRYScreenpH(5))];
    [line setBackgroundColor:MainColor];
    [headview addSubview:line];
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
    ChatVController *vc = [ChatVController new];
    [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
}


@end
