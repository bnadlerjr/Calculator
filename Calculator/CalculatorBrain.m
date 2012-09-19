//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Bob Nadler on 9/6/12.
//  Copyright (c) 2012 Bob Nadler, Jr. All rights reserved.
//

#import "CalculatorBrain.h"

/*
 * Private Interface
 */
@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

- (double)popOperand;

@end

@implementation CalculatorBrain

- (void)clear {
    [self.operandStack removeAllObjects];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    
    /* REFACTOR:
     * This is ugly. Not sure what idiomatic Obj-C would look like here. In
     * Ruby I would store the commands in a hash with the keys being the operations
     * and the values procs for the command. Then it's just a matter of "call"-ing
     * them. In Java I would create an interface with an implementation class for
     * each command.
     */
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    } else if ([@"-" isEqualToString:operation]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([@"/" isEqualToString:operation]) {
        double divisor = [self popOperand];
        if (divisor) {
            result = [self popOperand] / divisor;
        }
    } else if ([@"cos" isEqualToString:operation]) {
        result = cos([self popOperand]);
    } else if ([@"sin" isEqualToString:operation]) {
        result = sin([self popOperand]);
    } else if ([@"sqrt" isEqualToString:operation]) {
        result = sqrt([self popOperand]);
    } else if ([@"π" isEqualToString:operation]) {
        result = M_PI;
    }
    
    [self pushOperand:result];
    
    return result;
}

- (void)pushOperand:(double)operand {
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

/*
 * Private Implementation
 * ----------------------
 */

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack {
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    return _operandStack;
}

- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    
    if (operandObject) {
        [self.operandStack removeLastObject];
    }
    
    return [operandObject doubleValue];
}

@end