//
//  ViewController.m
//  24.DrawingApp
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.red = 0.0/255.0;
    self.green = 0.0/255.0;
    self.blue = 0.0/255.0;
    self.brush = 10.0;
    self.opacity = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - touches began,moved, ended, cancelled
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.mouseSwiped=NO;
    UITouch *touch=[touches anyObject];
    self.lastPoint=[touch locationInView:self.view];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.mouseSwiped=YES;
    UITouch *touch=[touches anyObject];
    CGPoint currentPoint=[touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.brush);
    CGContextSetRGBStrokeColor(context, self.red, self.green, self.blue, 1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGContextStrokePath(context);
    self.tempDrawImage.image=UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:self.opacity];
    UIGraphicsEndImageContext();
    
    self.lastPoint=currentPoint;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!self.mouseSwiped) {

        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        
        
        CGContextRef context=UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, self.brush);
        CGContextSetRGBStrokeColor(context, self.red, self.green, self.blue, self.opacity);
        
        CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y);
        CGContextAddLineToPoint(context, self.lastPoint.x, self.lastPoint.y);

        CGContextStrokePath(context);
        CGContextFlush(context);
        self.tempDrawImage.image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

    }
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) blendMode:kCGBlendModeNormal alpha:self.opacity];
    self.mainImage.image=UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image=nil;
    UIGraphicsEndImageContext();
}
#pragma mark -Actions
- (IBAction)pencilPressed:(id)sender {
}

- (IBAction)eraserPressed:(id)sender {
}

- (IBAction)reset:(id)sender {
}

- (IBAction)save:(id)sender {
}

- (IBAction)settings:(id)sender {
}
@end
