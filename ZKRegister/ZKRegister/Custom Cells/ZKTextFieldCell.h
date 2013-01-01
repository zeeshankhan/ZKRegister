//
//  ZKTextFieldCell.h
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKViewController.h"

@interface ZKTextFieldCell : UITableViewCell <ConfigureCustomCellDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtInput;

@end
