//
//  RFPasswordStrength.m
//  RFPasswordStrength
//
//  Created by Ricardo Funk on 12/9/13.
//  Copyright (c) 2013 Ricardo Funk. All rights reserved.
//

#import "RFPasswordStrength.h"

@implementation RFPasswordStrength

+(int)checkPasswordStrengthWithPassword:(NSString *)password {
    
    //Default strength set to weak
    int strength = 2;
    
    int passwordLength  = [password length];
    int upperCaseLetter = [self countUppercaseLetters:password];
    int numbers         = [self countNumbers:password];
    int symbols         = [self countSymbols:password];
    
    
    //Check for weak password strength
    if (passwordLength < 7 ) {
        strength = weak;
        return strength;
    }
    
    //Check for strong password strength
    if ((passwordLength > 12) && (upperCaseLetter > 0) && (numbers > 0) && (symbols > 0)) {
        strength = strong;
        return strength;
    }
    
    //Check for medium password strength
    if (passwordLength > 6 && upperCaseLetter > 0) {
        strength = medium;
        return strength;
    }
    
    return strength;
}

+(int) countUppercaseLetters:(NSString *)password {
    
    int count=0;
    
    for (int i = 0; i < [password length]; i++) {
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[password characterAtIndex:i]];
        if (isUppercase == YES)
            count++;
    }
    
    return count;
    
}

+(int) countNumbers:(NSString *)password {
    
    int count=0;
    
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([password rangeOfCharacterFromSet:set].location != NSNotFound) {
        count++;
    }
    

    return count;
    
}

+(int) countSymbols:(NSString *)password {
    
    int count=0;
    
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"`~!@#$%^&*()_+-={}[]:\";'<'"];
    
    if ([password rangeOfCharacterFromSet:set].location != NSNotFound) {
        count++;
    }
    
    
    return count;
    
}



@end
