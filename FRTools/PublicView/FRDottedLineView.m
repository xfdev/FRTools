//
//  FRDottedLineView.m
//  FRTools
//
//  Created by sonny on 17/3/1.
//  Copyright © 2017年 github.com/xfdev. All rights reserved.
//

#import "FRDottedLineView.h"

@implementation FRDottedLineView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self viewInstance];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self viewInstance];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    CGMutablePathRef path = CGPathCreateMutableCopy(shapeLayer.path);
    //设置虚线绘制路径终点
    CGPathAddLineToPoint(path, NULL, self.frame.size.width, 0);
    shapeLayer.path = path;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    shapeLayer.strokeColor = _strokeColor.CGColor;
}
- (void)setLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern {
    _lineDashPattern = [lineDashPattern copy];
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    shapeLayer.lineDashPattern = _lineDashPattern;
}

- (void)viewInstance {
    
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    //    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    //设置虚线颜色
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    //设置虚线宽度
    shapeLayer.lineWidth = 1.0;
    shapeLayer.lineCap = kCALineCapRound;
    
    shapeLayer.lineDashPattern = @[@7, @5];
    
    //创建虚线绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置虚线绘制路径起点
    CGPathMoveToPoint(path, NULL, 0, 0);
    //设置虚线绘制路径终点
    //    CGPathAddLineToPoint(path, NULL, self.frame.size.width, 0);
    //设置虚线绘制路径
    shapeLayer.path = path;
    CGPathRelease(path);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
