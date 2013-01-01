//
//  ZKRegisterModel.m
//  ZKRegister
//
//  Created by Zeeshan Khan on 13/11/12.
//  Copyright (c) 2012 Zeeshan Khan. All rights reserved.
//

#import "ZKRegisterModel.h"

@implementation ZKRegisterModel

- (BOOL)validatePhone:(id *)ioValue error:(NSError * __autoreleasing *)outError {
    
    NSCharacterSet *decimalSet = [NSCharacterSet decimalDigitCharacterSet];
    BOOL isValidNumbers = [[(NSString *)*ioValue stringByTrimmingCharactersInSet:decimalSet] isEqualToString:@""];
    int length = [(NSString *)*ioValue length];
    if (isValidNumbers && length==10) {
        return YES;
    }
    else {
        if (outError != NULL) {
            NSDictionary *userInfoDict = @{ NSLocalizedDescriptionKey : @"Phone number error" };
            *outError = [[NSError alloc] initWithDomain:@"Phone_number_error_domain"
                                                   code:1001
                                               userInfo:userInfoDict];
        }
        return NO;
    }
}

- (BOOL)validateEmail:(id*)ioValue error:(NSError* __autoreleasing *)outError {

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValidEmailId = [emailTest evaluateWithObject:(NSString*)*ioValue];
    if ( isValidEmailId ) {
        return YES;
    }
    else {
        if (outError != NULL) {
            NSDictionary *userInfoDict = @{ NSLocalizedDescriptionKey : @"Email error" };
            *outError = [[NSError alloc] initWithDomain:@"Phone_number_error_domain"
                                                   code:1002
                                               userInfo:userInfoDict];
        }
        return NO;
    }
}

@end
