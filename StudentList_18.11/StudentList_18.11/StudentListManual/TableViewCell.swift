//
//  TableViewCell.swift
//  StudentList_18.11
//
//  Created by Арина  on 29.11.21.
//

import UIKit

class TableViewCell: UITableViewCell {

    let cellTableView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.clipsToBounds = true
        return cellView
    }()
    
    let title: UILabel = {
        let labelName = UILabel()
        labelName.text = " "
        labelName.textColor = .black
        labelName.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        labelName.adjustsFontSizeToFitWidth = true
        labelName.textAlignment = .left
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        
        return labelName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTitle()
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupTitle(){
        backgroundColor = UIColor.white
        addSubview(cellTableView)
        cellTableView.addSubview(title)
        
        cellTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellTableView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       
        
        
        title.topAnchor.constraint(equalTo: cellTableView.topAnchor,constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: cellTableView.leadingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: cellTableView.trailingAnchor).isActive = true
       
    }

}
