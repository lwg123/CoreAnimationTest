//
//  TransformViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/19.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()
@property (nonatomic,strong) UIView *layerView;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"Snowman"].CGImage;
    [self.view addSubview:self.layerView];
    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.layerView.layer.affineTransform = transform;
    [self test1];
}


- (void)test1 {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformRotate(transform, M_PI/180.0 * 30);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    self.layerView.layer.affineTransform = transform;
}



@end
