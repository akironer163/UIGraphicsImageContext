//
//  ViewController.m
//  002-图像上下文
//
//  Created by HM on 16/10/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _imageView.image = [self drawDemo2];
}

- (UIImage *)drawDemo2 {
    
    // 1. 开启图像上下文 － 可以异步执行！生成结果之后，在主线程更新UI
    // 输出的图像的 scale == 1，在 iPhone 7+ 上不清楚
    // UIGraphicsBeginImageContext(_imageView.bounds.size);
    // scale 设置为 0，会使用主屏幕的分辨率，一定记住用下面的方法 (240 * 128) => (720 * 384)
    UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
    
    // 绘制内容
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_imageView.bounds];
    
    path.lineWidth = 2;
    [path stroke];
    
    // 5. 从图像上下文，获取绘制结果
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6. 关闭图像上下文
    UIGraphicsEndImageContext();
    
    return result;
}

// 1. 生成`图像`，设置给 imageView
- (UIImage *)drawDemo1 {
    
    // 1. 开启图像上下文 － 可以异步执行！生成结果之后，在主线程更新UI
    UIGraphicsBeginImageContext(_imageView.bounds.size);
    
    // 2. 图形上下文 - 绘图函数都是一样的，如果选择不同的上下文，结果会绘制到不同的目标
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 给上下文添加矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, 100, 100));
    
    // 设置颜色
    [[UIColor blueColor] set];
    
    // 让上下文绘制内容 - 填充 + 边线
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // 5. 从图像上下文，获取绘制结果
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();

    // 6. 关闭图像上下文
    UIGraphicsEndImageContext();
    
    return result;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
