//
//  ZKTextFieldCell.m
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import "ZKTextFieldCell.h"

@interface ZKTextFieldCell ()
@property (nonatomic, strong) NSMutableDictionary *dicProperties;
@property (nonatomic, weak) id <CallBackFromCustomCellDelegate> callBackDelegate;
@end

@implementation ZKTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Delegate

- (void)initializeCustomCellPropertiesWithCellDictionary:(NSMutableDictionary*)dicCell andObject:(id)object {
    _dicProperties = dicCell;
    _callBackDelegate = object;

    self.lblTitle.text = [dicCell objectForKey:@"Title"];
    
    self.txtInput.placeholder = [dicCell objectForKey:@"Placeholder"];
    self.txtInput.secureTextEntry = [[dicCell objectForKey:@"IsSecure"] boolValue];

    UIKeyboardType type = [[dicCell objectForKey:@"KeyboardType"] intValue];
    self.txtInput.keyboardType = type;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[self callBackDelegate] setCustomCellValue:textField.text forKey:[[self dicProperties] objectForKey:@"Key"]];
}

@end
