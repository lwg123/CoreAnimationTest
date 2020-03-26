//
//  ClockTestViewController.m
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/14.
//  Copyright © 2020 weiguang. All rights reserved.
//

#import "ClockTestViewController.h"

@interface ClockTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *minImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secImageView;

@property (nonatomic,weak) NSTimer *timer;

@end

@implementation ClockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 调整anchorpoint,这个地方是关键点，不然锚点在中心
    self.hourImageView.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.minImageView.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.secImageView.layer.anchorPoint = CGPointMake(0.5, 0.9);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];

    [self tick];
}


- (void)tick {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    // 计算时分秒的角度
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    //旋转
    self.hourImageView.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minImageView.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secImageView.transform = CGAffineTransformMakeRotation(secsAngle);
    
}

@end
