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

/* 
 Converts Roman Numeral text in text box to real number
 http://www.mathsisfun.com/roman-numerals.html
 */
- (IBAction) calculateButtonPressed:(id)sender {
    NSString* numberString = [_numberTextField text];
    numberString = [numberString uppercaseString];
    
    // TODO - validate string for characters, and/or limit input
    // TODO - make custom keyboard for Roman Numeral entry
    // TODO - disable standard keyboard
    
    // convert letters to ordered array of numbers
    NSMutableArray *romanValues = [[NSMutableArray alloc] initWithCapacity:[numberString length]];
    for (int i=0; i < [numberString length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [numberString characterAtIndex:i]];
        
        int conversionResult = 0;
        if ([ichar isEqualToString:@"I"]) {
            conversionResult = 1;
        } else if ([ichar isEqualToString:@"V"]) {
            conversionResult = 5;
        } else if ([ichar isEqualToString:@"X"]) {
            conversionResult = 10;
        } else if ([ichar isEqualToString:@"L"]) {
            conversionResult = 50;
        } else if ([ichar isEqualToString:@"C"]) {
            conversionResult = 100;
        } else if ([ichar isEqualToString:@"D"]) {
            conversionResult = 500;
        } else if ([ichar isEqualToString:@"M"]) {
            conversionResult = 1000;
        }
        
        [romanValues addObject:[NSNumber numberWithInt: conversionResult]];
    }
    
    // calculate number from Roman Numeral
    int lastValue = 0;
    int total = 0;
    int runningTotal = 0;
    int intRomanValue = 0;

    for (int z = 0; z < [romanValues count]; z++) {
        NSNumber *romanValue = [romanValues objectAtIndex:z];
        intRomanValue = [romanValue intValue];
        
        if ((z == 0) || (intRomanValue <= lastValue)) {
            // if the first or lte last add
            runningTotal = intRomanValue;
        } else if (intRomanValue > lastValue) {
            // if greater take last from total and add new calculated value
            total = total - lastValue;
            runningTotal = intRomanValue - lastValue;
        }
        
        // save this number as the last one used
        lastValue = intRomanValue;
        
        total += runningTotal;
        
    }
    
    // TODO - show number as result
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
