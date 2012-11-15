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
    
    // TODO - calculate number from Roman Numeral
    /*
    I = 1
    V = 5
    X = 10
    L = 50
    C = 100
    D = 500
    M = 1000
    */
    int lastValue = 0;
    int total = 0;
    int runningTotal = 0;
    int intRomanValue = 0;
    NSLog(@"Start calculation");
    for (int z = 0; z < [romanValues count]; z++) {
        NSNumber *romanValue = [romanValues objectAtIndex:z];
        intRomanValue = [romanValue intValue];
        
        NSLog(@"romanValue %@", romanValue);
        if (z == 0) {
            // it's the first number so it is added
            NSLog(@"first number so adding");
            runningTotal = intRomanValue;
        } else if (intRomanValue > lastValue) {
            NSLog(@"gt last");
            // this number is greater than the previous
            // subtract previous from total
            // subtract previous from it
            total = total - lastValue;
            runningTotal = intRomanValue - lastValue;
        } else if (intRomanValue <= lastValue) {
            NSLog(@"lte last");
            runningTotal = intRomanValue;
        }
        // save this number as the last one used
        lastValue = intRomanValue;
        NSLog(@"running total: %d", runningTotal);
        total += runningTotal;
        
    }
    
    NSLog(@"Final total %d", total);
    /*
     When a symbol is the same as the one before it it is added
     If it is less then the one before it it is added to total
     If it is greater then the one before it, the one before is subtracted from it and the result
     added to the total
     
    When a symbol appears after a larger symbol it is added
    Example: VI = V + I = 5 + 1 = 6
     
    But if the symbol appears before a larger symbol it is subtracted
    Example: IX = X - I = 10 - 1 = 9
     
    Don't use the same symbol more than three times in a row.
     */
    
    // TODO - show number as result
    // TODO - make custom keyboard for Roman Numeral entry
    // TODO - disable standard keyboard
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
