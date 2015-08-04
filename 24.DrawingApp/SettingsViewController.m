//
//  SettingsViewController.m
//  24.DrawingApp
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Actions

- (IBAction)closeSettings:(id)sender {
    [self.delegate closeSettings:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sliderChanged:(UISlider *)sender {
    UISlider *changedSlider=sender;
    if ([changedSlider isEqual:self.brushControl]) {
        self.brush=self.brushControl.value;
        self.brushValueLabel.text=[NSString stringWithFormat:@"%1.f",self.brush];
        UIGraphicsBeginImageContext(self.brushPreview.frame.size);
        CGContextRef context=UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, self.brush);
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(context, 45, 45);
        CGContextAddLineToPoint(context, 45, 45);
        CGContextStrokePath(context);
        self.brushPreview.image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    } else if ([changedSlider isEqual:self.opacityControl]) {
        self.opacity=self.opacityControl.value;
        self.opaciteValueLabel.text=[NSString stringWithFormat:@"%1.2f",self.opacity];
        UIGraphicsBeginImageContext(self.brushPreview.frame.size);
        CGContextRef context=UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 20);
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, self.opacity);
        CGContextMoveToPoint(context, 45, 45);
        CGContextAddLineToPoint(context, 45, 45);
        CGContextStrokePath(context);
        self.opacityPreview.image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}
@end
