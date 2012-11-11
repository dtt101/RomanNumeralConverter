//
//  VGViewController.h
//  RomanNumeralConverter
//
//  Created by David Thompson on 11/11/2012.
//  Copyright (c) 2012 David Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) IBOutlet UIButton *calculateButton;

- (IBAction) calculateButtonPressed:(id)sender;

@end
