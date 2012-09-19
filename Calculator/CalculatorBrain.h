//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Bob Nadler on 9/6/12.
//  Copyright (c) 2012 Bob Nadler, Jr. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * The brain of a RPN calculator.
 */
@interface CalculatorBrain : NSObject

/*
 * Clear the calculator brain.
 */
- (void)clear;

/*
 * Perform the specified operation. Returns the result.
 */
- (double)performOperation:(NSString *)operation;

/*
 * Push an operand onto the brain's stack.
 */
- (void)pushOperand:(double)operand;

@end
