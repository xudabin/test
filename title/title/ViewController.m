//
//  ViewController.m
//  title
//
//  Created by mac on 15/11/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"e.jpg"];
    [self addText:image text:@"胡 v 经济崩溃"];
}

-(UIImage *)addText:(UIImage *)img text:(NSString *)text1{
    int w = img.size.width;
    int h = img.size.height;
    //lon = h - lon;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1);
    
    char* text  = (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];// "05/05/09";
    CGContextSelectFont(context, "Arial", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    
    
    //rotate text
    CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    
  //  CGContextShowTextAtPoint(context, 4, 52, text, strlen(text));
    
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return [UIImage imageWithCGImage:imageMasked];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
