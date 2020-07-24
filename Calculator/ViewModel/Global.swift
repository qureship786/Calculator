//
//  Global.swift
//  Calculator
//
//  Created by Parvez Qureshi on 18/07/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation

enum CalculatorOperation: Int {
    case Default_State = 10
    case Negation = 11
    case Percentage = 12
    case Divide = 13
    case Multiply = 14
    case Minus = 15
    case Plus = 16
    case EqualTo = 17
    
    func isBinaryOperation() -> Bool {
        var result = false
        if self == .Divide || self == .Multiply || self == .Minus || self == .Plus {
            result = true
        }
        return result
    }
    func isUnaryOperation() -> Bool {
        var result = false
        if self == .Percentage || self == .Negation{
            result = true
        }
        return result
    }
}
