//
//  DemoView.m
//  002-图像上下文
//
//  Created by HM on 16/10/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

// UIGraphicsGetCurrentContext - 在向视图绘制，必须在 drawRect 方法中！
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1. 图形上下文 - 绘图函数都是一样的，如果选择不同的上下文，结果会绘制到不同的目标
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 给上下文添加矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, 100, 100));
    
    // 设置颜色
    [[UIColor blueColor] set];
    
    // 让上下文绘制内容 - 填充 + 边线
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

@end
