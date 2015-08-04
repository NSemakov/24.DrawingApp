//
//  SettingsViewController.h
//  24.DrawingApp
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>

- (void) closeSettings:(id)sender;

@end

@interface SettingsViewController : UIViewController
- (IBAction)closeSettings:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *opaciteValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *brushControl;
@property (weak, nonatomic) IBOutlet UISlider *opacityControl;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;
@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;

@property (assign,nonatomic) CGFloat brush;
@property (assign,nonatomic) CGFloat opacity;
@property (weak,nonatomic) id<SettingsViewControllerDelegate> delegate;

- (IBAction)sliderChanged:(UISlider *)sender;


@end
