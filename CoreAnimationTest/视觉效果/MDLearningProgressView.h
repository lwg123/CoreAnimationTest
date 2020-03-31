//
//  MDLearningProgressView.h
//  mandarinApp
//
//  Created by weiguang on 2020/3/27.
//  Copyright © 2020 Duia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDLearningProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                     progress:(CGFloat)progress
              averageProgress:(CGFloat)averageProgress;

@end

NS_ASSUME_NONNULL_END
