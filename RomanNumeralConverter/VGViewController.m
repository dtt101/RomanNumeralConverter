//
//  VGViewController.m
//  RomanNumeralConverter
//
//  Created by David Thompson on 11/11/2012.
//  Copyright (c) 2012 David Thompson. All rights reserved.
//

#import "VGViewController.h"

@interface VGViewController ()

@end

@implementation VGViewController

- (IBAction) calculateButtonPressed:(id)sender {
    NSString* numberString = [_numberTextField text];
    NSLog(@"calculate pressed with %@", numberString);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
