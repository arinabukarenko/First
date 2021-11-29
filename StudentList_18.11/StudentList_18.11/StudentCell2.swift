//
//  StudentCell2.swift
//  StudentList_18.11
//
//  Created by Арина  on 22.11.21.
//

import UIKit

class StudentCell2: UITableViewCell {

    var titleLabel = UILabel()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         addSubview(titleLabel)
        
         setTitleLabelConstraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func setTitleLabelConstraints(){
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
         titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
         titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
     }

}
