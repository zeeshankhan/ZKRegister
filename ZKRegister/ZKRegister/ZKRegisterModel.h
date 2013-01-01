//
//  ZKRegisterModel.h
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKRegisterModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *password;

@end
