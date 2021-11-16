//
//  ManualLayoutCalculatorViewController.swift
//  c
//
//  Created by Арина  on 15.11.21.
//

import UIKit

class ManualLayoutCalculatorViewController: AbstractCalculatorViewController {
    
    override var displayLabel: UILabel! {
        set {
            
        }
        
        get {
            return manualDisplayLabel
        }
    }
    
    let manualDisplayLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        createUI()
        
    }
    
    func createUI() {
        addButtons()
    }
    func addButtons() {
        let equalButton = BinaryOperatorButton(type:.custom)
        equalButton.addTarget(self, action: #selector(equal), for: .touchUpInside)
        equalButton.setTitle("=", for: .normal)
        equalButton.setTitleColor(equalButton.selectedColor, for: .normal)
        equalButton.setTitleColor(equalButton.defaultColor, for: .selected)
        equalButton.backgroundColor = equalButton.defaultColor
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        equalButton.tag = 200
        
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(equalButton)
        
        NSLayoutConstraint.activate([
            equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            equalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            equalButton.heightAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let decimalSeparatorButton = DigitButton(type: .custom)
        decimalSeparatorButton.addTarget(self, action: #selector(dot), for: .touchUpInside)
        decimalSeparatorButton.setTitle(CalculatorLogic.formatter.decimalSeparator,  for: .normal)
        decimalSeparatorButton.setTitleColor(DigitButton.defaultTextColor, for: .normal)
        decimalSeparatorButton.backgroundColor = DigitButton.defaultBackgroundColor
          decimalSeparatorButton.titleLabel?.font = DigitButton.font
          decimalSeparatorButton.translatesAutoresizingMaskIntoConstraints = false
          
          view.addSubview(decimalSeparatorButton)
          NSLayoutConstraint.activate([
            decimalSeparatorButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -20),
                                      decimalSeparatorButton.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
                                      decimalSeparatorButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            decimalSeparatorButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
          ])
          
           let digit0Button = DigitButton.generate(title: "0")
           digit0Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
           
           view.addSubview(digit0Button)
           
           NSLayoutConstraint.activate([
            digit0Button.trailingAnchor.constraint(equalTo: decimalSeparatorButton.leadingAnchor, constant: -20),
            digit0Button.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            digit0Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit0Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
           ])
               
        manualDisplayLabel.font = UIFont.systemFont(ofSize: 70)
           manualDisplayLabel.textAlignment = .right
           manualDisplayLabel.textColor = .white
           manualDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(manualDisplayLabel)
           
        NSLayoutConstraint.activate([
            manualDisplayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            manualDisplayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            manualDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           ])
        
        let sumButton = BinaryOperatorButton(type: .custom)
        sumButton.addTarget(self, action:#selector(binaryOperandButonTapped), for: .touchUpInside)
               sumButton.setTitle("+", for: .normal)
               sumButton.setTitleColor(sumButton.selectedColor, for: .normal)
               sumButton.setTitleColor(sumButton.defaultColor, for: .selected)
               sumButton.backgroundColor = sumButton.defaultColor
               sumButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        sumButton.tag = 102
               sumButton.translatesAutoresizingMaskIntoConstraints = false
               
               view.addSubview(sumButton)
               
               NSLayoutConstraint.activate([
                   sumButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
                   sumButton.bottomAnchor.constraint(equalTo: equalButton.topAnchor, constant: -20),
                   sumButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
                   sumButton.heightAnchor.constraint(equalTo: sumButton.widthAnchor)
               ])
        let digit3Button = DigitButton.generate(title: "3")
                digit3Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
                
                view.addSubview(digit3Button)
                
                NSLayoutConstraint.activate([
                    digit3Button.trailingAnchor.constraint(equalTo: sumButton.leadingAnchor, constant: -20),
                    digit3Button.bottomAnchor.constraint(equalTo: decimalSeparatorButton.topAnchor,constant: -20),
                    digit3Button.heightAnchor.constraint(equalTo: sumButton.heightAnchor),
                    digit3Button.widthAnchor.constraint(equalTo: digit3Button.heightAnchor)
                ])
        
        let digit2Button = DigitButton.generate(title: "2")
               digit2Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
               
               view.addSubview(digit2Button)
               
               NSLayoutConstraint.activate([
                   digit2Button.trailingAnchor.constraint(equalTo: digit3Button.leadingAnchor, constant: -20),
                   digit2Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
                   digit2Button.heightAnchor.constraint(equalTo: digit3Button.heightAnchor),
                   digit2Button.widthAnchor.constraint(equalTo: digit2Button.heightAnchor)
               ])
        let digit1Button = DigitButton.generate(title: "1")
                digit1Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
                
                view.addSubview(digit1Button)
                
                NSLayoutConstraint.activate([
                    digit1Button.trailingAnchor.constraint(equalTo: digit2Button.leadingAnchor,constant: -20),
                    digit1Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
                    digit1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    digit1Button.heightAnchor.constraint(equalTo: digit2Button.heightAnchor),
                    digit1Button.widthAnchor.constraint(equalTo: digit1Button.heightAnchor)
                    
                ])
        let subtractButton = BinaryOperatorButton(type: .custom)
        subtractButton.addTarget(self, action: #selector(binaryOperandButonTapped), for: .touchUpInside)
               subtractButton.setTitle("-", for: .normal)
               subtractButton.setTitleColor(equalButton.selectedColor, for: .normal)
               subtractButton.setTitleColor(equalButton.defaultColor, for: .selected)
               subtractButton.backgroundColor = equalButton.defaultColor
               subtractButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        subtractButton.tag = 103
               
               subtractButton.translatesAutoresizingMaskIntoConstraints = false
               
               view.addSubview(subtractButton)
               
               NSLayoutConstraint.activate([
                   subtractButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
                   subtractButton.bottomAnchor.constraint(equalTo: sumButton.topAnchor, constant: -20),
                   subtractButton.widthAnchor.constraint(equalTo: sumButton.widthAnchor),
                   subtractButton.heightAnchor.constraint(equalTo: subtractButton.widthAnchor)
               ])
        
        let digit6Button = DigitButton.generate(title: "6")
                digit6Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
                
                view.addSubview(digit6Button)
                
                NSLayoutConstraint.activate([
                    digit6Button.trailingAnchor.constraint(equalTo: subtractButton.leadingAnchor, constant: -20),
                    digit6Button.bottomAnchor.constraint(equalTo: digit3Button.topAnchor, constant: -20),
                    digit6Button.heightAnchor.constraint(equalTo: subtractButton.heightAnchor),
                    digit6Button.widthAnchor.constraint(equalTo: digit6Button.heightAnchor)
                ])
        
        let digit5Button = DigitButton.generate(title: "5")
        digit5Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit5Button)
        
        NSLayoutConstraint.activate([
            digit5Button.trailingAnchor.constraint(equalTo: digit6Button.leadingAnchor, constant: -20),
            digit5Button.bottomAnchor.constraint(equalTo: digit2Button.topAnchor, constant: -20),
            digit5Button.heightAnchor.constraint(equalTo: digit6Button.heightAnchor),
            digit5Button.widthAnchor.constraint(equalTo: digit5Button.heightAnchor)
        ])
        
        let digit4Button = DigitButton.generate(title: "4")
        digit4Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit4Button)
        
        NSLayoutConstraint.activate([
            digit4Button.trailingAnchor.constraint(equalTo: digit5Button.leadingAnchor, constant: -20),
            digit4Button.bottomAnchor.constraint(equalTo: digit1Button.topAnchor, constant: -20),
            digit4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit4Button.heightAnchor.constraint(equalTo: digit5Button.heightAnchor),
            digit4Button.widthAnchor.constraint(equalTo: digit4Button.heightAnchor)
            ])
        
        let multiplyButton = BinaryOperatorButton(type: .custom)
        multiplyButton.addTarget(self, action: #selector(binaryOperandButonTapped), for: .touchUpInside)
        multiplyButton.setTitle("×", for: .normal)
        multiplyButton.setTitleColor(equalButton.selectedColor, for: .normal)
        multiplyButton.setTitleColor(equalButton.defaultColor, for: .selected)
        multiplyButton.backgroundColor = equalButton.defaultColor
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        multiplyButton.tag = 100
               
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
               
               view.addSubview(multiplyButton)
               
               NSLayoutConstraint.activate([
                multiplyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
                multiplyButton.bottomAnchor.constraint(equalTo: subtractButton.topAnchor, constant: -20),
                multiplyButton.widthAnchor.constraint(equalTo: subtractButton.widthAnchor),
                multiplyButton.heightAnchor.constraint(equalTo: multiplyButton.widthAnchor)
               ])
        
        let digit9Button = DigitButton.generate(title: "9")
        digit9Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit9Button)
        
        NSLayoutConstraint.activate([
            digit9Button.trailingAnchor.constraint(equalTo: multiplyButton.leadingAnchor, constant: -20),
            digit9Button.bottomAnchor.constraint(equalTo: digit6Button.topAnchor, constant: -20),
            digit9Button.heightAnchor.constraint(equalTo: multiplyButton.heightAnchor),
            digit9Button.widthAnchor.constraint(equalTo: digit9Button.heightAnchor)
            ])
        
        let digit8Button = DigitButton.generate(title: "8")
        digit8Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit8Button)
        
        NSLayoutConstraint.activate([
            digit8Button.trailingAnchor.constraint(equalTo: digit9Button.leadingAnchor, constant: -20),
            digit8Button.bottomAnchor.constraint(equalTo: digit5Button.topAnchor, constant: -20),
            digit8Button.heightAnchor.constraint(equalTo: digit9Button.heightAnchor),
            digit8Button.widthAnchor.constraint(equalTo: digit8Button.heightAnchor)
            ])
        let digit7Button = DigitButton.generate(title: "7")
        digit7Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit7Button)
        
        NSLayoutConstraint.activate([
            digit7Button.trailingAnchor.constraint(equalTo: digit8Button.leadingAnchor, constant: -20),
            digit7Button.bottomAnchor.constraint(equalTo: digit4Button.topAnchor, constant: -20),
            digit7Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit7Button.heightAnchor.constraint(equalTo: digit8Button.heightAnchor),
            digit7Button.widthAnchor.constraint(equalTo: digit7Button.heightAnchor)
            ])
        
        let divideButton = BinaryOperatorButton(type:.custom)
        divideButton.addTarget(self, action: #selector(binaryOperandButonTapped), for: .touchUpInside)
        divideButton.setTitle("÷", for: .normal)
        divideButton.setTitleColor(equalButton.selectedColor, for: .normal)
        divideButton.setTitleColor(equalButton.defaultColor, for: .selected)
        divideButton.backgroundColor = equalButton.defaultColor
        divideButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        divideButton.tag = 101
        
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(divideButton)
        
        NSLayoutConstraint.activate([
            divideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            divideButton.bottomAnchor.constraint(equalTo: multiplyButton.topAnchor, constant: -20),
            divideButton.widthAnchor.constraint(equalTo: multiplyButton.widthAnchor),
            divideButton.heightAnchor.constraint(equalTo: divideButton.widthAnchor),
            divideButton.topAnchor.constraint(equalTo: manualDisplayLabel.bottomAnchor, constant: 20)
        ])
        let percentButton = UnaryOperatorButton(type: .custom)

        percentButton.addTarget(self, action: #selector(unaryOperatorTapped), for: .touchUpInside)
        percentButton.setTitle("%", for: .normal)
        percentButton.setTitleColor(percentButton.defaultTextColor, for: .normal)
        percentButton.backgroundColor = percentButton.defaultBackgroundColor
        percentButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        percentButton.tag = 201
        
        percentButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(percentButton)
        
        NSLayoutConstraint.activate([
            percentButton.trailingAnchor.constraint(equalTo: divideButton.leadingAnchor, constant: -20),
            percentButton.bottomAnchor.constraint(equalTo: digit9Button.topAnchor, constant: -20),
            percentButton.heightAnchor.constraint(equalTo: divideButton.heightAnchor),
            percentButton.widthAnchor.constraint(equalTo: percentButton.heightAnchor),
            percentButton.topAnchor.constraint(equalTo: manualDisplayLabel.bottomAnchor, constant: 20)
        ])
        let invertButton = UnaryOperatorButton(type: .custom)

        invertButton.addTarget(self, action: #selector(unaryOperatorTapped), for: .touchUpInside)
        invertButton.setTitle("±", for: .normal)
        invertButton.setTitleColor(percentButton.defaultTextColor, for: .normal)
        invertButton.backgroundColor = percentButton.defaultBackgroundColor
        invertButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        invertButton.tag = 202
        
        invertButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(invertButton)
        
        NSLayoutConstraint.activate([
            invertButton.trailingAnchor.constraint(equalTo: percentButton.leadingAnchor, constant: -20),
            invertButton.bottomAnchor.constraint(equalTo: digit8Button.topAnchor, constant: -20),
            invertButton.heightAnchor.constraint(equalTo: percentButton.heightAnchor),
            invertButton.widthAnchor.constraint(equalTo: invertButton.heightAnchor),
            invertButton.topAnchor.constraint(equalTo: manualDisplayLabel.bottomAnchor, constant: 20)
        ])
        
        let allClearButton = UnaryOperatorButton(type: .custom)

        allClearButton.addTarget(self, action: #selector(allClear), for: .touchUpInside)
        allClearButton.setTitle("AC", for: .normal)
        allClearButton.setTitleColor(allClearButton.defaultTextColor, for: .normal)
        allClearButton.backgroundColor = allClearButton.defaultBackgroundColor
        allClearButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        allClearButton.tag = 104
        
        allClearButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(allClearButton)
        
        NSLayoutConstraint.activate([
            allClearButton.trailingAnchor.constraint(equalTo: invertButton.leadingAnchor, constant: -20),
            allClearButton.bottomAnchor.constraint(equalTo: digit7Button.topAnchor, constant: -20),
            allClearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            allClearButton.heightAnchor.constraint(equalTo: invertButton.heightAnchor),
            allClearButton.widthAnchor.constraint(equalTo: allClearButton.heightAnchor),
            allClearButton.topAnchor.constraint(equalTo: manualDisplayLabel.bottomAnchor, constant: 20)
        ])
        
        


        
 
     
        
        
          
          }
}
          
