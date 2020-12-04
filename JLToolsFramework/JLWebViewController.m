//
//  JLWebViewController.m
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/4.
//

#import "JLWebViewController.h"
#import <WebKit/WebKit.h>
@interface JLWebViewController ()

@end

@implementation JLWebViewController
{
    WKProcessPool * _pool;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pool = [[WKProcessPool alloc]init];
    
    WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
    
    /*
     WKProcessPool 用来配置进程池，与网页视图的资源共享有关
     提示： WKProcessPool类中没有暴露任何属性和方法，配置为同一个进程池的WebView会共享数据，例如Cookie、用户凭证等，开发者可以通过编写管理类来分配不同维度的WebView在不同进程池中。
     */
    config.processPool = _pool;
    WKPreferences * preferences = [[WKPreferences alloc]init];
    preferences.minimumFontSize = 10;//最小字体
    preferences.javaScriptEnabled = YES;//是否java交互
    preferences.javaScriptCanOpenWindowsAutomatically = NO;//JavaScript可以打开没有用户交互的窗口
    if (@available(iOS 13.0, *)) {
        preferences.fraudulentWebsiteWarningEnabled = YES;//是否应警告针对可疑的欺诈性内容（例如网络钓鱼或恶意软件）显示该功能目前在中国可用
    }
    
    config.preferences = ({
        WKPreferences * preferences = [[WKPreferences alloc]init];
        preferences.minimumFontSize = 10;//最小字体
        preferences.javaScriptEnabled = YES;//是否java交互
        preferences.javaScriptCanOpenWindowsAutomatically = NO;//JavaScript可以打开没有用户交互的窗口
        if (@available(iOS 13.0, *)) {
            preferences.fraudulentWebsiteWarningEnabled = YES;//是否应警告针对可疑的欺诈性内容（例如网络钓鱼或恶意软件）显示该功能目前在中国可用
        }
        preferences;
    });
    
    WKWebView * view = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:view];
}


@end
