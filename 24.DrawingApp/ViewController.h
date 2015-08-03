//
//  ViewController.h
//  24.DrawingApp
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
- (IBAction)pencilPressed:(id)sender;
- (IBAction)eraserPressed:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)settings:(id)sender;

@property(assign,nonatomic) CGPoint lastPoint;
@property(assign,nonatomic) CGFloat red;
@property(assign,nonatomic) CGFloat green;
@property(assign,nonatomic) CGFloat blue;
@property(assign,nonatomic) CGFloat brush;
@property(assign,nonatomic) CGFloat opacity;
@property(assign,nonatomic) BOOL mouseSwiped;

@end

