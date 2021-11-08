//
//  ViewController.swift
//  c
//
//  Created by Арина  on 2.11.21.
//

import UIKit

enum BinaryOperand: Int{
    case multiply = 100
    case substruct = 103
    case sum = 102
    case divide = 101
    
    
}

class StoryboardedCalculatorViewController: UIViewController {
    //шапка - переменные, константы
    @IBOutlet weak var displayLabel: UILabel!
    
    
    var displayText: String = "0" {
        didSet {
            displayLabel.text = displayText
            
            if operand == nil{
                value1 = Double(displayText)
            }else {
                value2 = Double(displayText)
            }
            
        }
    }
    var value1: Double?
    var value2: Double?
    var operand: BinaryOperand?
    var needToRestartTextLabel = false
    // перезапись MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayText = "0"
        
    }
    // MARK: - IBActions
    @IBAction func digitButtonTapped(_ digitButton: UIButton) { updateDisplayText(with: String(digitButton.tag))
    }
    @IBAction func binaryOperandButonTapped(_ sender: BinaryOperatorButton) {
        guard let type = BinaryOperand(rawValue: sender.tag) else {
            print("unkown type")
            return
            
        }
        operand = type
        needToRestartTextLabel = true
    }
    @IBAction func allClear(_ sender: UIButton) {
        if displayText != ""{
        displayText = "0"
        }
    }
    @IBAction func equals(_ sender: UIButton) {
        needToRestartTextLabel{
            value2 =
        }
    }
    // MARK: - Functions
    func updateDisplayText(with newText: String) {
        if displayText == "0" && newText == "0" {
            return
        }
        if displayText == "0"{
            displayText = newText
            return
        }
        if displayText.count >= 9 {
            return
        }
        if needToRestartTextLabel{
            displayText = newText
            needToRestartTextLabel = false
        }else {
            displayText += newText
        }
    }
    // MARK: - Calculation logic
    static func calculate(value1:Double, value2:Double, operand:BinaryOperand)-> Double {
        switch operand {
        case .multiply:
            return value1 * value2
        case .substruct:
            return value1 - value2
        case .sum:
            return value1 + value2
        case .divide:
            return value1 / value2
            // default: return 0 (выборочная обработка), безопасный код
        }
    }
}








// class static (self/Self), static func(чистая функция без side эффектов)
//unit tests
//выводить результат/добавить файл в гитхаб (дата) и вносить комитом изменения


