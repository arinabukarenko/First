//
//  BinaryOperatorButton.swift
//  c
//
//  Created by Арина  on 6.11.21.
//

import UIKit

class BinaryOperatorButton: RoundedButton {
    let defaultColor = UIColor.systemOrange
    let selectedColor = UIColor.white

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
            isSelected = true
        }}
    
    func operatorTag(title: String) -> BinaryOperatorButton{
        let tagOperator = BinaryOperatorButton(type: .custom)
        tagOperator.tag = Int(title)!
        
        return tagOperator
        }
    }

