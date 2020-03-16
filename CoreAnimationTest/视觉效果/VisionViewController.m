//
//  VisionViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/16.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "VisionViewController.h"

@interface VisionViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation VisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test1];
}


/**
 CAShapeLayer + mask,
 用一个CAShapeLayer绘制出某个形状，然后将它作为另一个图层的蒙版来实现一些炫酷的效果
*/
- (void)test1 {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(80, 80, 300, 300);
    layer.contents = (__bridge id)[UIImage imageNamed:@"content"].CGImage;
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    // 起始点在(图片宽的一半,0)的位置
    [bezierPath moveToPoint:CGPointMake(150, 0)];
    // 大概估算一下x和y的值
    [bezierPath addLineToPoint:CGPointMake(40, 150)];
    
    // 向右拉一条二阶贝塞尔曲线，控制点在中部偏下
    [bezierPath addQuadCurveToPoint:CGPointMake(260, 150) controlPoint:CGPointMake(150, 300)];
    // 闭合曲线，这样就会从当前点(150,300)到起始点(150,0)连线来进行闭合
    [bezierPath closePath];
    
    // 构造蒙版图层
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = bezierPath.CGPath;
    
    // 因为maskLayer的填充颜色默认是存在的，所以可以直接作为蒙版
    layer.mask = maskLayer;
    
    // 修改一下
    //填充颜色为透明，填充内容将不再作为蒙版内容
    maskLayer.fillColor = [UIColor clearColor].CGColor;
    // 任意颜色，只要不透明就行，描线颜色就将作为蒙版内容
    maskLayer.strokeColor = [UIColor redColor].CGColor;
    maskLayer.lineWidth = 30;
    
    // 为上面的maskLayer添加一个strokeEnd的动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.duration = 3.0;
    animation.fromValue = @0;
    
    // 由于maskLayer默认的strokeEnd就是1，所以这里不再需要重新设置modelLayer的属性
    [maskLayer addAnimation:animation forKey:nil];
    
}




- (void)test {
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:self.imageView];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(50, 0, 100, 100);
    
    UIImage *maskImage = [UIImage imageNamed:@"2"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    self.imageView.layer.mask = maskLayer;
}

@end
