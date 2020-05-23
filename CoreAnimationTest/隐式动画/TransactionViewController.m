//
//  TransactionViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/31.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong)  CALayer *colorLayer;
@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    //self.containerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.containerView];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.containerView.layer addSublayer:self.colorLayer];
    
    // 修改动画的actions可以创建一个行为
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor" : transition};
    
}

// 使用presentationLayer图层来判断当前图层位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //[self changeColor];
    
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        //randomize the layer background color
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    }else {
         //otherwise (slowly) move the layer to new position
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
    
}


- (void)changeColor
{
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}



- (void)changeColor2 {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}

- (void)changeColor3 {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}





@end
