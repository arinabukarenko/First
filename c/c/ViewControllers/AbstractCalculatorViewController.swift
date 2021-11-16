//
//  AbstractCalculatorViewController.swift
//  c
//
//  Created by Арина  on 15.11.21.
//

import UIKit

class AbstractCalculatorViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    let calculatorLogic = CalculatorLogic()
    
    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()

        calculatorLogic.parentVC = self
    }
    
// MARK: - IBActions
    
    @IBAction func digitButtonTapped(_ digitButton: UIButton){
    calculatorLogic.updateDisplayText(with: String(digitButton.tag))
        }

    @IBAction func binaryOperandButonTapped(_ sender: UIButton) {
           guard let binaryOperand = BinaryOperand(rawValue: sender.tag)
           else {
               print("unkown operand")
               return
           }
        calculatorLogic.executeBinaryOperand(binaryOperand: binaryOperand)
}
    @IBAction func unaryOperatorTapped(_ sender: UIButton) {
            guard let unaryOperand = UnaryOperand(rawValue: sender.tag) else {
                print("unknown operand")
                return
            }
        
        calculatorLogic.executeUnaryOperand(unaryOperand: unaryOperand)
        
    }
    
    @IBAction func equal(_ sender: Any){
        calculatorLogic.executeEqual()
    }
    @IBAction func dot(_ sender: Any){
        calculatorLogic.executeDot()
    }
    @IBAction func allClear(_ sender: Any) {
        calculatorLogic.executeAllClear()
    }
}
