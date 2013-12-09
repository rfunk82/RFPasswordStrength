//
//  RFPasswordStrength.h
//  RFPasswordStrength
//
//  Created by Ricardo Funk on 12/9/13.
//  Copyright (c) 2013 Ricardo Funk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum PasswordStrength : NSUInteger {
    strong,
    medium,
    weak
} PasswordStrength;

@interface RFPasswordStrength : NSObject

+(int)checkPasswordStrengthWithPassword:(NSString *)password;

@end
