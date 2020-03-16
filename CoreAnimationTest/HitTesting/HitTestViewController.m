//
//  HitTestViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/14.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "HitTestViewController.h"

@interface HitTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;


@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.blueLayer];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // [self test1:touches];
    
    [self test2:touches];
}

// hitTest:方法
- (void)test2:(NSSet<UITouch *> *)touches {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // get touched layer
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        
        [self alertBlueVC];
    }else if(layer == self.layerView.layer) {
        
        [self alertWhiteVC];
    }
}


// containsPoint:方法
- (void)test1:(NSSet<UITouch *> *)touches {
    
    // 获取当前触摸点在self.view中的坐标
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // 转换坐标到白色layer坐标系
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    // 如果包含在白色layer中
    if ([self.layerView.layer containsPoint:point]) {
        // 在转换到蓝色layer坐标系
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        if ([self.blueLayer containsPoint:point]) {
            
            [self alertBlueVC];
            
        }else {
            [self alertWhiteVC];
        }
    }
}


- (void)alertBlueVC {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"点击范围" message:@"在蓝色范围内" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)alertWhiteVC {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"点击范围" message:@"在白色范围内" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
