//
//  CalculationViewModel.swift
//  Calculator
//
//  Created by Parvez Qureshi on 18/07/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation

protocol CalculatorDelegate {
    func updateResult(content: String)
}


class Calculator {
    var currentCalculationOperation: CalculatorOperation = .Default_State
    var firstOperand: String = ""
    var secondOperand: String = ""
    var delegate: CalculatorDelegate?
    let max_value = Double(Int.max)
    
    var firstOperandNumber: Double {
        if let fOperand = Double(firstOperand) {
            return fOperand
        }
        return 0.0
    }
    
    var secondOperandNumber: Double {
        if let sOperand = Double(secondOperand) {
            return sOperand
        }
        return 0.0
    }
    
    func numberPressed(aNumber: Int) {
        if currentCalculationOperation == .Default_State {
            firstOperand.append(String(aNumber))
            processResponse(result: firstOperandNumber)
        } else if currentCalculationOperation.isBinaryOperation() {
            secondOperand.append(String(aNumber))
            processResponse(result: secondOperandNumber)
        } else if currentCalculationOperation.isUnaryOperation(){
            firstOperand.append(String(aNumber))
        }
    }
    private func shareResponse(content: String) {
        self.delegate?.updateResult(content: content)
    }
    private func processResponse(result: Double){
        let intResult = floor(result)
        if intResult == result {//division gives an integer result
            if intResult < max_value {
                shareResponse(content: String(Int(intResult)))
            } else {
                shareResponse(content: String(intResult))
            }
            
        } else {
            shareResponse(content: String(result))
        }
    }
    func reset() {
        currentCalculationOperation = .Default_State
        firstOperand = ""
        secondOperand = ""
    }
    func performCalculation() {
        switch currentCalculationOperation {
        case .Divide:
            let result = firstOperandNumber / secondOperandNumber
            processResponse(result: result)
            reset()
        case .Multiply:
            let result = firstOperandNumber * secondOperandNumber
            processResponse(result: result)
            reset()
        case .Minus:
            let result = firstOperandNumber - secondOperandNumber
            processResponse(result: result)
            reset()
        case .Plus:
            let result = firstOperandNumber + secondOperandNumber
            processResponse(result: result)
            reset()
        case .Negation:
            let result = -firstOperandNumber
            processResponse(result: result)
            reset()
        case .Percentage:
            let result = firstOperandNumber / 100
            processResponse(result: result)
            reset()
        default:
            print("Default")
        }
    }
    func markOperation(index: Int) {
        if let anOperation = CalculatorOperation(rawValue: index) {
            switch anOperation {
                case .Default_State:
                    self.resetCalculator()
                case .Negation:
                    currentCalculationOperation = .Negation
                    performCalculation()
                case .Divide:
                    currentCalculationOperation = .Divide
                case .Multiply:
                    currentCalculationOperation = .Multiply
                case .Minus:
                    currentCalculationOperation = .Minus
                case .EqualTo:
                    performCalculation()
                case .Percentage:
                    currentCalculationOperation = .Percentage
                case .Plus:
                    currentCalculationOperation = .Plus
            }
        }
    }
    private func resetCalculator(){
        self.firstOperand = ""
        self.secondOperand = ""
        self.currentCalculationOperation = .Default_State
        self.delegate?.updateResult(content: "0")
    }
}
