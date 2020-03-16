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
