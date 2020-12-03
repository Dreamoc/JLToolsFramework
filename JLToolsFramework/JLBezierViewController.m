//
//  JLBezierViewController.m
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/2.
//

#import "JLBezierViewController.h"

@interface JLBezierViewController ()

@end

@implementation JLBezierViewController
{
    MyBezierView * _view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self create];
}

- (void)create {
    _view = [[MyBezierView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 500)];
    [self.view addSubview:_view];
    _view.offsetY = 500;

    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(run) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)run {
    _view.offsetY-=1;
    [_view setNeedsDisplay];
}

@end

@implementation MyBezierView
{
    BOOL der;
    UIBezierPath *path;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        path = [UIBezierPath bezierPath];

    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    // 创建一个贝塞尔曲线句柄


    // 初始化该path到一个初始点
    path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointMake(0, 0)];

//    // 添加一条直线

//    [path addLineToPoint:CGPointMake(0, 0)];

    // 画二元曲线，一般和moveToPoint配合使用
    NSLog(@"%.2f",_offsetY*1.2);
    
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width, 0) controlPoint:CGPointMake(self.frame.size.width/2, _offsetY*1.2)];

    // 关闭该path

    [path closePath];

    // 创建描边（Quartz）上下文

    CGContextRef context = UIGraphicsGetCurrentContext();

    // 将此path添加到Quartz上下文中

    CGContextAddPath(context, path.CGPath);

    // 设置本身颜色

    [[UIColor redColor] set];

    // 设置填充的路径

    CGContextFillPath(context);

}

@end
