//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Bob Nadler on 9/6/12.
//  Copyright (c) 2012 Bob Nadler, Jr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (void)clear;

@end
