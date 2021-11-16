//
//  UnaryOperatorButton.swift
//  c
//
//  Created by Арина  on 16.11.21.
//

import UIKit

class UnaryOperatorButton: RoundedButton {

    let defaultBackgroundColor = UIColor.lightGray
    let defaultTextColor = UIColor.white
    
    func unaryButtons(title:String) -> UnaryOperatorButton{
        let tagNumber = UnaryOperatorButton(type: .custom)
        tagNumber.tag = Int(title)!
        
        return tagNumber
        
    }
    
    
    
    
}
