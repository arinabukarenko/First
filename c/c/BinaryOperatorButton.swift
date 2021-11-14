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
            
        }
        }
        }

    

