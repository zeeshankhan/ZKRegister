//
//  ZKSliderCell.h
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKViewController.h"

@interface ZKSliderCell : UITableViewCell <ConfigureCustomCellDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;

@end
