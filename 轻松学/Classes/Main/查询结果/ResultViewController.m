//
//  ResultViewController.m
//  轻松学
//
//  Created by 陈剑英 on 2018/5/19.
//  Copyright © 2018年 陈剑英. All rights reserved.
//

#import "ResultViewController.h"
#import "SizeHeader.h"

#define COMMITTAG 1000000
#define WEBVIEWTAG 30000

@interface ResultViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;//所有题目的滚动视图
@property(nonatomic,strong)UIScrollView *currentScrollView;//当前题目的滚动视图


@end

@implementation ResultViewController

//懒加载
-(UIScrollView *)scrollView
{
    if (_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(LRYScreenpW(57), TopAndSystemHeight+LRYScreenpH(75), ScreenWidth-2*LRYScreenpW(57), ScreenHeight-TopAndSystemHeight-LRYScreenpH(75)-LRYScreenpH(120))];
        
    }
    return _scrollView;
}

-(UIScrollView *)currentScrollView
{
    if (_currentScrollView == nil)
    {
        _currentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-2*LRYScreenpW(57), ScreenHeight-TopAndSystemHeight-LRYScreenpH(75)-LRYScreenpH(120))];
        
    }
    return _currentScrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTopTitle:@"资源"];
    [self setTopTitleColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置pagecontroller
    [self setPageController];
    
    //设置错题录入按钮
    [self setErrorCommitBtn];
    
    //将currentScrollerView添加进scrollerview
    [self setCurrentScrollview];
    
    //设置所有题目的scrollerview
    [self.view addSubview:self.scrollView];
}

//设置pagecontroller
-(void)setPageController
{
    UIPageControl *page=[[UIPageControl alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight, ScreenWidth, LRYScreenpH(75))];
    page.numberOfPages = 5;
    page.pageIndicatorTintColor = UIColorRGB(228);
    page.currentPageIndicatorTintColor = UIColorRGB(153);
    page.userInteractionEnabled = NO;
    [self.view addSubview:page];
}

//设置错题录入按钮
-(void)setErrorCommitBtn
{
    UIButton *commit = [self createBtn:CGRectMake(0, ScreenHeight-LRYScreenpH(120), ScreenWidth, LRYScreenpH(120)) title:@"错题录入"  iconImage:nil backgroundImage:nil tag:COMMITTAG textColor:[UIColor whiteColor]];
    //[commit.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(20)]];
    commit.backgroundColor = YWQColor(255, 75, 85);
    [self.view addSubview:commit];
}

//添加当前题目进滚动视图
-(void)setCurrentScrollview
{
//    for(int i=0;i<5;i++)
//    {
        //放webview
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.currentScrollView.frame), 200)];
        webView.tag = WEBVIEWTAG;
        webView.delegate = self;//指定delegate
        //加载本地html
        NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
        NSURL *url = [NSURL fileURLWithPath:path];//创建URL
        NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
        [webView loadRequest:request];//加载
        
        [self.currentScrollView addSubview:webView];
        
        //添加 直接录入按钮
    
        
        
        //添加进全部题目的滚动视图
        [self.scrollView addSubview:self.currentScrollView];
//    }
    
}


#pragma mark  uiwebview的delegate方法

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //第一种获取html高度的方法
    CGSize size =  webView.scrollView.contentSize;
    NSLog(@"%f",size.height);
    
    //当webview加载完成之后，改变webview的高度，以及scrollerview的contentsize
    webView.frame = CGRectMake(0, 0, ScreenWidth-2*LRYScreenpW(57), size.height);
    //改变btnview的frame
    
    webView.userInteractionEnabled = NO;
    //改变当前scrollerview的contentsize
    self.currentScrollView.contentSize = CGSizeMake(0, size.height);
    
    
    
    //第2种获取html高度的方法
//    CGRect frame = webView.frame;
//    frame.size.height = 1;
//    webView.frame = frame;
//    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];//网页所需要的高度
//    frame.size = fittingSize;
//    webView.frame = frame;
//    NSLog(@"------%f",fittingSize.height);
    
    
}









@end
