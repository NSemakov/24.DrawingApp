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
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SettingsViewController *settingsVC=(SettingsViewController*)segue.destinationViewController;
    settingsVC.delegate=self;
    settingsVC.brush=self.brush;
    settingsVC.opacity=self.opacity;
}
- (void) closeSettings:(id)sender {
    self.brush=((SettingsViewController*) sender).brush;
    self.opacity=((SettingsViewController*) sender).opacity;
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    UIButton* pressedButton=(UIButton*) sender;
    switch(pressedButton.tag)
    {
        case 0:
            self.red = 0.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 1:
            self.red = 105.0/255.0;
            self.green = 105.0/255.0;
            self.blue = 105.0/255.0;
            break;
        case 2:
            self.red = 255.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 3:
            self.red = 0.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 255.0/255.0;
            break;
        case 4:
            self.red = 102.0/255.0;
            self.green = 204.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 5:
            self.red = 102.0/255.0;
            self.green = 255.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 6:
            self.red = 51.0/255.0;
            self.green = 204.0/255.0;
            self.blue = 255.0/255.0;
            break;
        case 7:
            self.red = 160.0/255.0;
            self.green = 82.0/255.0;
            self.blue = 45.0/255.0;
            break;
        case 8:
            self.red = 255.0/255.0;
            self.green = 102.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 9:
            self.red = 255.0/255.0;
            self.green = 255.0/255.0;
            self.blue = 0.0/255.0;
            break;
    }
}


- (IBAction)eraserPressed:(id)sender {
    self.red = 255.0/255.0;
    self.green = 255.0/255.0;
    self.blue = 255.0/255.0;
    self.opacity = 1.0;
}

- (IBAction)reset:(id)sender {
    self.mainImage.image=nil;
}

- (IBAction)save:(id)sender {
}

- (IBAction)settings:(id)sender {
}
@end
