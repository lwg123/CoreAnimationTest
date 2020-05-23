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
#import "TransformViewController.h"
#import "TransitionViewController.h"
#import "LayerViewController.h"
#import "TransactionViewController.h"
#import "CAAnimationViewController.h"


static NSString *cellID = @"cellID";

@interface ViewController ()<CALayerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"图层",@"锚点",@"HitTesting",@"视觉效果",@"变换", @"转场动画",@"专用图层",@"隐式动画",@"显式动画",nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
        {
            ClockTestViewController *clockVC = [[ClockTestViewController alloc] init];
            [self.navigationController pushViewController:clockVC animated:YES];
        }
            break;
        case 2:
        {
            HitTestViewController *hitTestVC = [[HitTestViewController alloc] init];
            [self.navigationController pushViewController:hitTestVC animated:YES];
        }
            break;
        case 3:
        {
            VisionViewController *visionVC = [[VisionViewController alloc] init];
            [self.navigationController pushViewController:visionVC animated:YES];
        }
            break;
        case 4:
        {
            TransformViewController *transformVC = [[TransformViewController alloc] init];
            [self.navigationController pushViewController:transformVC animated:YES];
        }
            break;
        case 5:
        {
            TransitionViewController *transitionVC = [[TransitionViewController alloc] init];
            [self.navigationController pushViewController:transitionVC animated:YES];
        }
            break;
        case 6:
        {
            LayerViewController *layerVC = [[LayerViewController alloc] init];
            [self.navigationController pushViewController:layerVC animated:YES];
        }
            break;
        case 7:
        {
            TransactionViewController *transactionVC = [[TransactionViewController alloc] init];
            [self.navigationController pushViewController:transactionVC animated:YES];
        }
            break;
        case 8:
        {
            CAAnimationViewController *animationVC = [[CAAnimationViewController alloc] init];
            [self.navigationController pushViewController:animationVC animated:YES];
        }
            break;
            
            
        default:
            break;
    }
}


- (void)test3 {
    
     CALayer *blueLayer = [CALayer layer];
     blueLayer.frame = CGRectMake(50, 50, 100, 100);
     blueLayer.backgroundColor = [UIColor blueColor].CGColor;
     blueLayer.delegate = self;
     [self.layerView.layer addSublayer:blueLayer];
    
     [blueLayer display];
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
