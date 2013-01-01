//
//  ZKViewController.h
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfigureCustomCellDelegate <NSObject>
- (void)initializeCustomCellPropertiesWithCellDictionary:(NSMutableDictionary*)dicCell andObject:(id)object;
@end

@protocol CallBackFromCustomCellDelegate <NSObject>
- (void)setCustomCellValue:(id)value forKey:(id)key;
@end

@interface ZKViewController : UIViewController <UITableViewDataSource, CallBackFromCustomCellDelegate>
@property (nonatomic, strong) IBOutlet UITableViewCell *cell;
@end
