//
//  MainViewController.m
//  轻松学
//
//  Created by 陈剑英 on 2018/5/19.
//  Copyright © 2018年 陈剑英. All rights reserved.
//

#import "MainViewController.h"
#import "SizeHeader.h"
#import "LoginViewController.h"
#import "ResultViewController.h"
#import "ViewManager.h"
#import "viewController.h"
#import "courseDetaViewController.h"
#define CAMARATAG 100000
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MainViewController

-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    LoginViewController *lvc=[LoginViewController new];
    [self presentModalViewController:lvc animated:NO];
    [self setTopTitle:@"首页"];
    [self setBackBtnHide:YES];
    [self setTopTitleColor:[UIColor whiteColor]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark--------------电源栏字体颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];

    
//    设置课表
    UIButton *courseBtn=[self createBtn:CGRectMake(ScreenWidth-LRYScreenpW(80), TopAndSystemHeight-LRYScreenpH(60), LRYScreenpW(50), LRYScreenpH(50)) title:nil iconImage:[UIImage imageNamed:@"wd_19"] backgroundImage:nil tag:10001 textColor:nil];
    
    [courseBtn setBackgroundColor:[UIColor whiteColor]];
    [courseBtn.layer setMasksToBounds:YES];
    [courseBtn.layer setCornerRadius:13];
    [courseBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [courseBtn addTarget:self action:@selector(courseClick) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:courseBtn];
    
    //设置背景图片
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight, LRYScreenpW(750), LRYScreenpH(611))];
    bgImage.image = [UIImage imageNamed:@"sy_8"];
    [self.view addSubview:bgImage];
    
    //照相机按钮
    
    UIButton *camara = [self createBtn:CGRectMake(LRYScreenpW(210), TopAndSystemHeight+LRYScreenpH(51), ScreenWidth-2*LRYScreenpW(210), ScreenWidth-2*LRYScreenpW(210)) title:nil  iconImage:nil backgroundImage:[UIImage imageNamed:@"sy_9"] tag:CAMARATAG textColor:nil];
    [self.view addSubview:camara];
    
//    当前课程表
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bgImage.frame), ScreenWidth, ScreenHeight-CGRectGetMaxY(bgImage.frame)) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.scrollEnabled=NO;
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
}

-(void)btnAction:(UIButton *)sender
{
    long int tag = sender.tag;
    //照相机
    if (tag == CAMARATAG)
    {
        [self OpenCamera];
        
        
    }
}

-(void)courseClick{
    
    viewController *CourseView=[[viewController alloc]init];
    [[ViewManager shareInstance].NavigationController pushViewController:CourseView animated:YES];
}

//打开相机
-(void)OpenCamera
{
    //运行的设备是否支持拍照
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        //选中的图片传回
        imagePickerController.delegate = self;
        
        //设置可编辑
        imagePickerController.allowsEditing = YES;
        
        //设置图片源为相机来源
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
        
    }else
    {
        NSLog(@"模拟机打开相机，请用真机打开");
    }
}

//打开相册
-(void)OpenPhoto
{
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.allowsEditing = YES;
    
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
    
}


//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//
//{
//    NSLog(@"%@",info);
//    
//    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
//    //当选择的类型是图片
//    if ([type isEqualToString:@"public.image"])
//    {
//        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//        head = image;
//        [self.personInfoTable reloadData];
//        [imagePickerController dismissViewControllerAnimated:YES completion:nil];
//    }
//}
//


#pragma mark--------tableview相关函数
//区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//课程  时间  地点   教师 签到情况 评价
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LRYScreenpH(90);
    
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return LRYScreenpH(60);
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return LRYScreenpH(300);
}

//行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"CellID";
    UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    if (CellView == nil)
    {
        
        CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        NSArray *arry=[NSArray arrayWithObjects:@"课程",@"时间",@"地点",@"教师",@"出勤情况" ,nil];
        NSArray *arry1=[NSArray arrayWithObjects:@"软件工程",@"上午8:30-10:10",@"1B301",@"陈雄峰",@"是" ,nil];
        UILabel *labText=[self createLabel:CGRectMake(LRYScreenpW(100), LRYScreenpH(20), LRYScreenpW(180), CellView.frame.size.height-LRYScreenpH(10)) title:arry[indexPath.row] fontSize:21 textColor:YWQColor(105, 105, 105)];
        [labText setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:labText];
        
        UILabel *labText2=[self createLabel:CGRectMake(CGRectGetMaxX(labText.frame)+LRYScreenpW(100), LRYScreenpH(20), LRYScreenpW(300), CellView.frame.size.height-LRYScreenpH(10)) title:arry1[indexPath.row] fontSize:19 textColor:YWQColor(105, 105, 105)];
        [labText2 setBackgroundColor:[UIColor clearColor]];
        [CellView addSubview:labText2];

        [CellView setBackgroundColor:[UIColor clearColor]];
    }
    CellView.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return CellView;

}
//区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(150))];
    [headview setBackgroundColor:[UIColor clearColor]];
    UILabel *headLable =[self createLabel:CGRectMake(LRYScreenpW(20), LRYScreenpH(5), ScreenWidth, LRYScreenpH(100)) title:@"当前课程" fontSize:22 textColor:MainColor];
    headLable.textAlignment = UITextAlignmentCenter;
    [headLable setBackgroundColor:[UIColor whiteColor]];
    
    [headview addSubview:headLable];
    
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, headLable.frame.size.height, ScreenWidth, LRYScreenpH(5))];
    [line setBackgroundColor:MainColor];
    [headview addSubview:line];
    return headview;
    
}
//区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    
    UIView *footview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(50))];
    [footview setBackgroundColor:[UIColor clearColor]];
    
    UIButton * courseDetaBtn =[self createBtn:CGRectMake(LRYScreenpW(170), LRYScreenpH(140), ScreenWidth-LRYScreenpW(300), LRYScreenpH(60)) title:@"课程详情" iconImage:nil backgroundImage:[UIImage imageNamed:@"圆角矩形-13-拷贝-14"] tag:10000 textColor:[UIColor whiteColor]];
    [courseDetaBtn addTarget:self action:@selector(courseDetaBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [courseDetaBtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)]];
    [footview addSubview:courseDetaBtn];
    return footview;
}


//课程详情
-(void)courseDetaBtnClick{
    courseDetaViewController *vc=[courseDetaViewController new];
    [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
}







@end
