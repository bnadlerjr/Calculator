//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Bob Nadler on 9/6/12.
//  Copyright (c) 2012 Bob Nadler, Jr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

/*
 * Main calculator display.
 */
@property (weak, nonatomic) IBOutlet UILabel *display;

/*
 * Shows the history of all operands that have been entered since
 * display was last cleared.
 */
@property (weak, nonatomic) IBOutlet UILabel *displayHistory;

@end
