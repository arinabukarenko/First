//
//  RoundedeButton.swift
//  c
//
//  Created by Арина  on 6.11.21.
//

import UIKit

class RoundedButton: UIButton {

    func roundCorners(){
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners()
    }
}
