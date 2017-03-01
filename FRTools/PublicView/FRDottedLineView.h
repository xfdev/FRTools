//
//  FRDottedLineView.h
//  FRTools
//
//  Created by sonny on 17/3/1.
//  Copyright © 2017年 github.com/xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>


// 支持 AutoLayout 的虚线 View
@interface FRDottedLineView : UIView

@property (nonatomic, strong) UIColor *strokeColor;// 虚线颜色
@property (nonatomic, copy) NSArray<NSNumber *> *lineDashPattern;

@end
