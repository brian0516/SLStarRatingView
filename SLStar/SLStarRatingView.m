//
//  SLStar.m
//  SLStar
//
//  Created by shuanglong on 16/9/20.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLStarRatingView.h"

@interface SLStarRatingView ()

@property (nonatomic,strong)UIImageView * fullStarImageView;
@property (nonatomic,strong)UIImageView * emptyStarImageView;
@property (nonatomic,strong)UIView * middleView;

@end

@implementation SLStarRatingView

#pragma  -mark init
-(instancetype)init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}



#pragma -mark override
//重写布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.fullStarImageView.frame = self.bounds;
    self.emptyStarImageView.frame = self.bounds;
    self.middleView.frame = CGRectMake(self.progress*self.bounds.size.width, 0, self.bounds.size.width*(1-_progress), self.bounds.size.height);
    
    if (self.progressBlock) {
        self.progressBlock(self.progress);
    }
    
}


//---touch----
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self];
    _progress = point.x/self.bounds.size.width;
    [self setNeedsLayout];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self];
    if (point.x<self.bounds.size.width) {
          _progress = point.x/self.bounds.size.width;
         [self setNeedsLayout];
    }
    else{
        _progress = 1;
    }
}


-(void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    _middleView.backgroundColor = backgroundColor;
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}



#pragma -mark privateMethod
//initialize
-(void)initialize{
    
    _progress = 0;
    
    [self addSubview:self.fullStarImageView];
    [self addSubview:self.middleView];
    [self addSubview:self.emptyStarImageView];
}


#pragma -mark lazyload

-(UIImageView *)fullStarImageView{
    if (!_fullStarImageView) {
        _fullStarImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_full"]];
    }
    return _fullStarImageView;
}

-(UIImageView *)emptyStarImageView{
    if (!_emptyStarImageView) {
        _emptyStarImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_empty"]];
    }
    return _emptyStarImageView;
}

-(UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
        _middleView.backgroundColor = [UIColor whiteColor];
    }
    
    return _middleView;
}



@end
