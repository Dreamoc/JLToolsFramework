//
//  JLBezierViewController.m
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/2.
//

#import "JLBezierViewController.h"

@interface JLBezierViewController ()
@property (nonatomic, nullable, strong) UILabel * unlock;

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
    [self drawNormal];
    [self drawOvalInRect];
    [self drawRoundedRect];
    [self drawRoundedRectByRoundingCorners];
    [self drawArcCenter];
    [self drawLine];
    [self drawCurveLine];
    [self drawQuadCurveLine];

    [self jianbian];
//
//    MyBezierView * view= [[MyBezierView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
//    [self.view addSubview:view];
//    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(run) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)drawNormal {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 50, 50)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 0.5;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawOvalInRect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 0.5;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawRoundedRect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10.f];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 2, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 0.5;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawRoundedRectByRoundingCorners {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 40)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 3, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 0.5;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawArcCenter {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:M_PI_2 endAngle: 2 * M_PI clockwise:YES];
//    或者
//    UIBezierPath *bezierPath =  [UIBezierPath bezierPath];
//    [bezierPath addArcWithCenter:CGPointMake(25, 25) radius:25 startAngle:M_PI_2 endAngle: 2 * M_PI clockwise:YES];
    
    bezierPath = [bezierPath bezierPathByReversingPath];//翻转
    
    [bezierPath appendPath:[bezierPath bezierPathByReversingPath]];//添加一个path
        
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 4, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 0.5;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawLine {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];

    [bezierPath moveToPoint:CGPointMake(0,0)];

    [bezierPath addLineToPoint:CGPointMake(50, 50)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 5, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 1;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)drawCurveLine {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];

    [bezierPath moveToPoint:CGPointMake(0,0)];

    [bezierPath addCurveToPoint:CGPointMake(50, 50) controlPoint1:CGPointMake(0, 25) controlPoint2:CGPointMake(50, 25)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 6, 64 + 25);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 1;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

//二阶曲线
- (void)drawQuadCurveLine {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];

    [bezierPath moveToPoint:CGPointMake(0,0)];
    [bezierPath addQuadCurveToPoint:CGPointMake(50, 50) controlPoint:CGPointMake(0, 25)];
    CAShapeLayer * shape = [CAShapeLayer new];
    shape.frame = bezierPath.bounds;
    shape.position = CGPointMake(25 + 50 * 0, 64 + 25 + 50);
    shape.fillColor = [UIColor orangeColor].CGColor;
    shape.lineWidth = 2;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.strokeStart = 0;
    shape.strokeEnd = 1;
    shape.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shape];
}

- (void)jianbian {
    self.view.backgroundColor = [UIColor grayColor];
    CAGradientLayer *gra = [CAGradientLayer layer];
    [self.view.layer addSublayer:gra];
    gra.frame = CGRectMake(100, 200, 150, 100);
    gra.colors = @[
        (__bridge id)[UIColor blackColor].CGColor,
        (__bridge id)[UIColor whiteColor].CGColor,
        (__bridge id)[UIColor blackColor].CGColor,
                    ];
    gra.locations = @[@0.25,@0.5,@0.75];
    gra.startPoint = CGPointMake(0, 0.5);
    gra.endPoint = CGPointMake(1, 0.5);
    
    CABasicAnimation * ba = [CABasicAnimation animationWithKeyPath:@"locations"];
    ba.fromValue = @[@0,@0,@0.25];
    ba.toValue = @[@0.75,@1,@1];
    ba.duration = 2.5;
    ba.repeatCount = HUGE;
    [gra addAnimation:ba forKey:nil];
    
    UILabel *unlock = [[UILabel alloc] initWithFrame:gra.bounds];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:16];
    gra.mask = unlock.layer;
}
@end



@implementation MyBezierView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0,0)];

    [bezierPath addLineToPoint:CGPointMake(10, 50)];

    [bezierPath addLineToPoint:CGPointMake(100, 80)];

    bezierPath.lineWidth=5.0;
//        [[UIColor redColor] setStroke];
//        [[UIColor redColor] setFill];
    [bezierPath fill];

    [bezierPath stroke];

}
@end
