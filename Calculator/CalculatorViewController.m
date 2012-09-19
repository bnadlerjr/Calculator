//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Bob Nadler on 9/6/12.
//  Copyright (c) 2012 Bob Nadler, Jr. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

/*
 * Private Interface
 */
@interface CalculatorViewController()

@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic) BOOL userIsInMiddleOfEnteringNumber;

- (void)appendDigit:(NSString *)digit;
- (void)appendToDisplayHistory:(NSString *)text;
- (IBAction)clear;
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)enterPressed;
- (IBAction)operationPressed:(UIButton *)sender;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize displayHistory = _displayHistory;

/*
 * Private Implementation
 * ----------------------
 */

@synthesize brain = _brain;
@synthesize userIsInMiddleOfEnteringNumber = _userIsInMiddleOfEnteringNumber;

- (CalculatorBrain *)brain {
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    
    return _brain;
}

- (void)appendDigit:(NSString *)digit {
    NSRange range = [self.display.text rangeOfString:@"."];
    
    if ([digit isEqualToString:@"."] && range.location != NSNotFound) {
        // do nothing; don't append multiple .'s
    } else {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
}

- (void)appendToDisplayHistory:(NSString *)text {
    NSString *displayHistoryText = [text stringByAppendingString:@" "];
    self.displayHistory.text = [self.displayHistory.text stringByAppendingString:displayHistoryText];    
}

- (IBAction)clear {
    [self.brain clear];
    self.display.text = @"0";
    self.displayHistory.text = @"";
}


- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    
    if (self.userIsInMiddleOfEnteringNumber) {
        [self appendDigit:digit];
    } else {
        self.display.text = digit;
        self.userIsInMiddleOfEnteringNumber = YES;
    }
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInMiddleOfEnteringNumber = NO;
    [self appendToDisplayHistory:self.display.text];
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInMiddleOfEnteringNumber) {
        [self enterPressed];
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    [self appendToDisplayHistory:operation];
}

@end