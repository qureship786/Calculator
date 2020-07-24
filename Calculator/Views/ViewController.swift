//
//  ViewController.swift
//  Calculator
//
//  Created by Parvez Qureshi on 16/07/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    var calc: Calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calc.delegate = self
    }
    @IBAction func numberButtonClicked(sender: Any) {
        if let button = sender as? UIButton {
            calc.numberPressed(aNumber: button.tag)
        }
    }
    @IBAction func operatorButtonClicked(sender: Any) {
        if let button = sender as? UIButton {
            calc.markOperation(index: button.tag)
        }
    }
}

extension ViewController: CalculatorDelegate{
    func updateResult(content: String) {
        self.lblResult.text = content
    }
}

