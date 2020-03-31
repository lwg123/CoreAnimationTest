//
//  UIView+ShadowPath.h
//  CoreAnimationTest
//
//  Created by weiguang on 2020/3/27.
//  Copyright © 2020 weiguang. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ShadowType) {
    ShadowPathTop    = 1,
    ShadowPathBottom = 2,
    ShadowPathLeft   = 3,
    ShadowPathRight  = 4,
    ShadowPathCommon = 5,
    ShadowPathAround = 6,
};

@interface UIView (ShadowPath)

/**
 给UIView添加阴影
 @param shadowColor 阴影颜色
 @param shadowOpacity 阴影透明度 默认0
 @param shadowRadius 阴影半径 也就是阴影放射程度 默认3
 @param shadowPathType 阴影方向
 @param shadowPathWidth 阴影放射g宽度
 */
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(ShadowType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;



@end

NS_ASSUME_NONNULL_END
