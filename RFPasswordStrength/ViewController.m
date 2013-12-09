//
//  ViewController.m
//  RFPasswordStrength
//
//  Created by Ricardo Funk on 12/9/13.
//  Copyright (c) 2013 Ricardo Funk. All rights reserved.
//

#import "ViewController.h"
#import "RFPasswordStrength.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UILabel *displayPasswordStrength;
- (IBAction)textChanged:(UITextField *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.passwordField setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textChanged:(UITextField *)sender {
    
    //Use class method to get Password Strength
    int passwordStrength = [RFPasswordStrength checkPasswordStrengthWithPassword:self.passwordField.text];
    
    //Change Label
    if (passwordStrength == 0) {
        self.displayPasswordStrength.backgroundColor = [UIColor greenColor];
        self.displayPasswordStrength.text = @"Strong";
    } else if (passwordStrength == 1) {
        self.displayPasswordStrength.backgroundColor = [UIColor colorWithRed:(229/255.0) green:(226/255.0) blue:(3/255.0) alpha:1];
        self.displayPasswordStrength.text = @"Medium";
    } else if (passwordStrength == 2) {
        self.displayPasswordStrength.backgroundColor = [UIColor redColor];
        self.displayPasswordStrength.text = @"Weak";
    }
    
}
@end
