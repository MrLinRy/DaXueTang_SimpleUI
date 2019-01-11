//
//  SizeHeader.h
//  projectBase
//
//  Created by linruyan on 15-9-11.
//  Copyright (c) 2015年 linruyan. All rights reserved.
//

#ifndef projectBase_SizeHeader_h 
#define projectBase_SizeHeader_h



#define ScreenWidth             [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight            [[UIScreen mainScreen] bounds].size.height
#define iOS7AndAbove            ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define TopBarHeight            (iOS7AndAbove ? 64:44)
#define TopAndSystemHeight      (ScreenHeight == 812.0 ? 88 : 64)
//#define TopAndSystemHeight      (TopBarHeight + SystemHeight)
#define SystemTopY              (iOS7AndAbove ? 20:0)
#define SystemHeight            (iOS7AndAbove ? 0:20)
#define BottomHeight            53
#define StateBarHeight          [[UIApplication sharedApplication] statusBarFrame].size.height//电源条
#define LRYScreenpW(ww)  ww*([[UIScreen mainScreen] bounds].size.width)/750
#define LRYScreenpH(hh)  hh*([[UIScreen mainScreen] bounds].size.height)/1334
#define LRYUIColorFromRGB(rgbValue,a) [UIColor colorWithRed:(((rgbValue & 0xFF0000 ) >>16))/255.0 green:(((rgbValue & 0x00FF00) >>8))/255.0 blue:((rgbValue & 0x0000FF))/255.0 alpha:a]
#define LRYsystemFontOfSize(value)((value)/414.0f*[UIScreen mainScreen].bounds.size.width)

//#define HeadUrl    @"http://116.62.243.203:8081" //正式发布
//#define HostUrl    @"http://116.62.243.203:8081" //正式发布
//#define YOUHUASHUOUrl    @"http://116.62.243.203:8081"//正式试用

#define HeadUrl    @"http://120.27.224.231:8081" //测试使用
#define HostUrl    @"http://120.27.224.231:8081" //测试使用
#define YOUHUASHUOUrl    @"http://120.27.224.231:8081" //测试使用

//iPhone X的宽高适配   以iPhone8 高度667.0 为例     iPhone X（1125 * 2436）
#define CJYWidthCoefficient (ScreenHeight == 812.0 ? 375.0/375.0 : ScreenWidth/375.0) //适配系数
#define CJYHeightCoefficient (ScreenHeight == 812.0 ? 667.0/667.0 : ScreenHeight/667.0) //适配系数
#define SafeAreaTopHeight (ScreenHeight == 812.0 ? 88 : 64) //顶部高度
 #define SafeAreaBottomHeight (ScreenHeight == 812.0 ? 34 : 0)//底部高度

//#define HeadUrl    @"http://120.27.224.231:8081" //暂时无用，不要用
//#define HostUrl    @"http://120.27.224.231:8081"
//#define HeadUrl    @"http://121.196.192.233:8081/"//测试用
//#define HostUrl    @"http://121.196.192.233:8081/"




//#define HostUrl    @"http://gy.fjmaimaimai.com:5669"
//#define HeadUrl          @"http://xg.fjmaimaimai.com:6666"
//#define HostUrl          @"http://xg.fjmaimaimai.com:6666"

//#define YOUHUASHUOUrl    @"http://192.168.1.193:8081"

//#define UmengAppkey @"58c2537175ca35143e001394"
//#define UmengAppkey @"58bd49e27666131f8e001146"
#define UmengAppkey   @"563c4af467e58e523600246e"

#define PINKCOlORSKIN  [UIColor colorWithRed:240.0/255 green:87.0/255 blue:129.0/255 alpha:1.0]
#define REDCOLORSKIN   [UIColor colorWithRed:202.0/255 green:43.0/255 blue:52.0/255 alpha:1.0]
//#define PINKCOlORSKIN   [UIColor colorWithRed:202.0/255 green:43.0/255 blue:52.0/255 alpha:1.0]

#define MainColor    YWQColor(0, 174, 255)

#define MainBgColor    [UIColor colorWithRed:249.0/255 green:249.0/255 blue:249.0/255 alpha:1.0]
#define SelectedColor    [UIColor colorWithRed:98.0/255 green:55.0/255 blue:41.0/255 alpha:1.0]
#define TextBgColor      [UIColor colorWithRed:244.0/255 green:237.0/255 blue:231.0/255 alpha:1.0]
#define YWQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define Notify_CloseSildeMenu  @"closeslidemenu"
#define Notify_ChangeSkin      @"Notify_ChangeSkin"
#define RefshHistoryKeyList    @"keyList"

#define UIColorRGB(value) [UIColor colorWithRed:value/255.0 green:value/255.0 blue:value/255.0 alpha:1.0]

#define NotifyURL  @"http://121.40.125.152:3000/stx/zfbPayCallBack"
#define PARTNER    @"2088001742457422"
#define SELLER     @"sotia__mail@163.com"
#define PRIVATEKEY    @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANMueSdTQGX7FtAoc4gJ5R6MfVzYQBud3dmY92ALqajGVWg/C9ggqrP205YpX9C81YDXNxxQugo40iH1ISwu1/KMhLVDgRuw0Yqwm1Ke+SIFWGzJCnxvw3Juk5bEkEihZh5OazHPWyy/trGX1w46hSs063PPCo3UpTIW+4NhreCbAgMBAAECgYBmHzcfOTcPGdjyWF1mD8Lofu+wkjKOKE08CKi3nWwx3Zc3jiVgIovp8xZmqyNWgbqNT4Wq/663errDCRM9lnl+RAecuyUrSQweXtpLsW0yW90MxDhgwnFYRcw1SpP6YrJAEpRryD/If6vh/WWa0zCsboIwV3O1rkO3ro35j/MDwQJBAPazSVL37WQA4Z6lpzVXqVuJOKcX7bXMGcsbxOhaM1YEr/W+CHZHne0pwT89q/gIWbJtBaZKEfYJhlftCWJn0CMCQQDbJGwkvC4nJTDRI28GjtyoQ2OODQMnB/bnm6j224o9GBAOY7MVlQ3n7/VomKvTTzsLRwa36+aTqufsYCAf73kpAkAcbYyFgwxX+cIGBhC+lNtvMODWYGuEB4DxZsHKBJrlzqR4LO3Ms3P/YFBkeTbX3h538Rg1kVOAhph0iVwLeusBAkEAmnoEWajlh+apkOO/ggn29g37AcmebUcp/341Dz8XJZXuy5XwSch2swbuIbttdFmnr31z+Par5XBWaMQiISD4cQJAF70wvOzfAargytLCll2hGrLbfc5+wGcYS38cRdZdbjwPrFKXLdFEY8JTP+EqY+B1H7cV2pBlYfu4gGBtnDTSRg=="

#define AppScheme  @"yikangle"

#define Notify_ShopCartList           @"Notify_ShopCartList"
#define Notify_ShopCartTip           @"Notify_ShopCartTip"
#define Notify_AddressList            @"Notify_AddressList"
#define Notify_RemoveAddressList      @"Notify_RemoveAddressList"
#define Notify_BianjiAddressList      @"Notify_BianjiAddressList"
#define Notify_RefreshShopList        @"Notify_RefreshShopList"
#define DESKEY  @"stx_mall20151019"
#define Notify_ThumailImageSize       @"Notify_ThumailImageSize"
#define Notify_TabBarOfIndex          @"Notify_TabBarOfIndex"
#define Notify_Gift                   @"Notify_Gift"
#define Notify_TabBarOfColor          @"Notify_TabBarOfColor"

//配置选项
//#define PersonShopId                  @"0"
#define IOSShareUrl                   @"http://www.pgyer.com/ssU7"
#define AndroidShareUrl               @"http://www.pgyer.com/hlu8"




#endif
