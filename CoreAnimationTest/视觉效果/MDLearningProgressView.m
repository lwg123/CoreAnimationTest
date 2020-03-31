//
//  MDLearningProgressView.m
//  mandarinApp
//
//  Created by weiguang on 2020/3/27.
//  Copyright © 2020 Duia. All rights reserved.
//

#import "MDLearningProgressView.h"
#import "UIView+ShadowPath.h"

@interface MDLearningProgressView()

@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,assign) CGFloat averageProgress;
@property (nonatomic,strong) UIView *progressView;
@property (nonatomic,strong) UILabel *progressLabel;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *shaowView;
@end

@implementation MDLearningProgressView

- (instancetype)initWithFrame:(CGRect)frame
                     progress:(CGFloat)progress
              averageProgress:(CGFloat)averageProgress {
    self = [super initWithFrame:frame];
    if (self) {
        _progress = progress;
        _averageProgress = averageProgress;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //[self createProgressView];
    [self createClass];
   // [self shaowView];
}

- (UIView *)shaowView{
    if (!_shaowView) {
        _shaowView = [[UIView alloc]init];
        _shaowView.frame = CGRectMake(0, 0, 100, 100);
        _shaowView.center = self.center;
        [_shaowView viewShadowPathWithColor:[UIColor blackColor] shadowOpacity:0.06 shadowRadius:8 shadowPathType:ShadowPathAround shadowPathWidth:6];
        _shaowView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_shaowView];
    }
    return _shaowView;
}

/*
- (void)createProgressView {
    _progressView = [[UIView alloc] initWithFrame:CGRectMake(32, 35, 140, 140)];
    [self addSubview:_progressView];
  //  _progressView.backgroundColor = [UIColor redColor];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_progressView.width/2.0, _progressView.height/2.0) radius:(_progressView.width - 6)/2 startAngle:-M_PI_2 endAngle:M_PI * 3.0 / 2.0 clockwise:YES];
    // 外圈
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = UIColorFromHex(0xF0F0F0).CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 6;
    shapeLayer.path = path.CGPath;
    [_progressView.layer addSublayer:shapeLayer];

    // 进度条
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = UIColorFromHex(0x675BFF).CGColor;;
    self.progressLayer.lineWidth = 6;
    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd = _progress;
    self.progressLayer.path = path.CGPath;
    [_progressView.layer addSublayer:self.progressLayer];

    // 进度Label
    self.progressLabel = [UILabel new];
    self.progressLabel.frame = CGRectMake(0, 0,_progressView.width, _progressView.height);
    self.progressLabel.font = DINPro_Bold(25);
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.textColor = UIColorFromHex(0x675BFF);
    self.progressLabel.text = [NSString stringWithFormat:@"%0.f%%",_progress*100];
    [_progressView addSubview:self.progressLabel];
    
}
 */

- (void)layoutSubviews {
    [super layoutSubviews];
    
     
}

- (void)createClass {
   // [self shaowView];
    
//    _shaowView = [[UIView alloc]init];
//    _shaowView.frame = CGRectMake(32, 34.5, 100, 67);
//   // _shaowView.center = self.center;
//    [_shaowView viewShadowPathWithColor:[UIColor blackColor] shadowOpacity:0.06 shadowRadius:8 shadowPathType:ShadowPathAround shadowPathWidth:6];
//    _shaowView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:_shaowView];
//
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(32, 34.5, 100, 67)];
    self.backView = backView; // 注意这句话的先后顺序，放在addSubview后面对阴影会有问题
    self.backView.backgroundColor = [UIColor whiteColor]; // 还有这句添加背景颜色一定要加上
    [self addSubview:_backView];
    
    [self.backView viewShadowPathWithColor:[UIColor blackColor] shadowOpacity:0.06 shadowRadius:8 shadowPathType:ShadowPathAround shadowPathWidth:6];
    
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15.5, 7, 6, 53)];//
    [backView addSubview:lineView];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(lineView.frame.origin.x + lineView.frame.size.width/2, CGRectGetMaxY(lineView.frame))];
    [path addLineToPoint:CGPointMake(lineView.frame.origin.x + lineView.frame.size.width/2, lineView.frame.origin.y)];

    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.strokeColor = [UIColor grayColor].CGColor;
    backLayer.fillColor = [UIColor clearColor].CGColor;
    backLayer.lineWidth = 6;
    backLayer.strokeStart = 0;
    backLayer.strokeEnd = 1;
    backLayer.lineCap = kCALineCapRound;
    backLayer.path = path.CGPath;
    [backView.layer addSublayer:backLayer];

    CAShapeLayer *progressL = [CAShapeLayer layer];
    progressL.strokeColor = [UIColor redColor].CGColor;
    progressL.fillColor = [UIColor clearColor].CGColor;
    progressL.lineWidth = 6;
    progressL.strokeStart = 0;
    progressL.strokeEnd = _progress;
    progressL.lineCap = kCALineCapRound;
    progressL.path = path.CGPath;
    [backView.layer addSublayer:progressL];

    UILabel *Lab1 = [[UILabel alloc] init];
    [backView addSubview:Lab1];


}



@end
