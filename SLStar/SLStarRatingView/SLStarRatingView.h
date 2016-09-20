//
//  SLStar.h
//  SLStar
//
//  Created by shuanglong on 16/9/20.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^floatBlock)(CGFloat progress);

@interface SLStarRatingView : UIView
{
    CGFloat _progress;
}

@property(nonatomic,assign,readonly)CGFloat progress;

@property(nonatomic,copy) floatBlock(progressBlock);


@end
