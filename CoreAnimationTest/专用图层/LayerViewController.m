//
//  LayerViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/19.
//  Copyright © 2020 weiguang. All rights reserved.
//
/**
 使用CAShapeLayer有以下一些优点：
 渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
 高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
 不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
 不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 */


#import "LayerViewController.h"

@interface LayerViewController ()

@property (nonatomic,strong) UIView *containerView;

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    self.containerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.containerView];
    
    [self test3];
}



// CATextLayer来显示一些文字
- (void)test3 {
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.containerView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.containerView.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    //set layer text
    textLayer.string = text;
    
}


// CAShapeLayer 创建一个CGPath
- (void)test {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    //设置起点
    [path moveToPoint:CGPointMake(175, 100)];
    // 画圆
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    //垂直横线
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    // 左腿
    [path addLineToPoint:CGPointMake(125, 225)];
    // 右腿
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    
    // 横线
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound; //连接处
    shapeLayer.lineCap = kCALineCapRound;  // 末尾处
    shapeLayer.path = path.CGPath;
    
    [self.containerView.layer addSublayer:shapeLayer];
}


// 绘制具有3个圆角的矩形
- (void)test2 {
    //define path parameters
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
}





@end
