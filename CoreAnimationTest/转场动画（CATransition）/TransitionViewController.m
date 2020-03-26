//
//  TransitionViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/19.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "TransitionViewController.h"
#import "ClockTestViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
   
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

- (void)test2 {
    
}



- (void)test {
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    animation.duration = 1.0;
    // 在window上执行CATransition, 即可在ViewController转场时执行动画
    [self.view.window.layer addAnimation:animation forKey:@"kTransitionAnimation"];
    
    ClockTestViewController *vc = [[ClockTestViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}



@end
