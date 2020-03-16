//
//  ViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/12.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "ViewController.h"
#import "ClockTestViewController.h"
#import "HitTestViewController.h"
#import "VisionViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.delegate = self;
    [self.layerView.layer addSublayer:blueLayer];
   
    [blueLayer display];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //ClockTestViewController *clockVC = [[ClockTestViewController alloc] init];
   // HitTestViewController *hitTestVC = [[HitTestViewController alloc] init];
    VisionViewController *visionVC = [[VisionViewController alloc] init];
    [self.navigationController pushViewController:visionVC animated:YES];
}


- (void)test2 {
    UIImage *image = [UIImage imageNamed:@"2.png"];
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button1.layer];
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}

- (void)test1 {
        
        
        UIImage *image = [UIImage imageNamed:@"Snowman.png"];
        
        self.layerView.layer.contents = (__bridge id)image.CGImage;
       // self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
        self.layerView.layer.contentsGravity = kCAGravityCenter;
        
        
        self.layerView.layer.masksToBounds = YES;
        
        // 这个不正确
        //self.layerView.layer.contentsScale = image.scale;
        self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
        
        self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
}




- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect ￼toLayer:(CALayer *)layer //set image
{
  layer.contents = (__bridge id)image.CGImage;

  //scale contents to fit
  layer.contentsGravity = kCAGravityResizeAspect;

  //set contentsRect
  layer.contentsRect = rect;
}


- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
  //set image
  layer.contents = (__bridge id)image.CGImage;

  //set contentsCenter
  layer.contentsCenter = rect;
}




#pragma mark -- CALayerDelegate --
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
