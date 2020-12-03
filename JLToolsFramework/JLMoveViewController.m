//
//  JLMoveViewController.m
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/2.
//

#import "JLMoveViewController.h"

@interface JLMoveViewController ()

@end

@implementation JLMoveViewController
{
    UIView * _moveView;
    CGPoint  _selfPoint;
    BOOL _canMove;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];

    
    UIView * view = [[UIView alloc]initWithFrame:view1.frame];
    view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    [self.view addSubview:view];
    
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    subView.backgroundColor = [UIColor blackColor];
    [view addSubview:subView];
    
    //锚点
    //anchorPoint   0~1 在这个view上选点，0.5，0.5就是中心位置。
    //position      移动位置，以锚点为主，移动到哪里。
    view.layer.anchorPoint = CGPointMake(0, 0);
    view.layer.position = CGPointMake(100, 100);
    _moveView = view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject]; // 从集合中快速去除点击的对象
    _selfPoint = [touch locationInView:_moveView];
    _canMove = [touch.view isDescendantOfView:_moveView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject]; // 从集合中快速去除点击的对象
    CGPoint currentPoint = [touch locationInView:self.view];
    if (_canMove) {
        currentPoint.x = currentPoint.x - _selfPoint.x;
        currentPoint.y = currentPoint.y - _selfPoint.y;
        _moveView.layer.position = currentPoint;
    }
}


@end
