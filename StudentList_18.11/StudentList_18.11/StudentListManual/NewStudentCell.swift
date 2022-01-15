//
//  NewStudentCell.swift
//  StudentList_18.11
//
//  Created by Арина  on 22.11.21.
//

import UIKit

class NewStudentCell: UITableViewCell {

    let avatarImageView = UIImageView()
    
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
            
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
               contentView.addSubview(avatarImageView)
               avatarImageView.backgroundColor = .blue
               
               NSLayoutConstraint.activate([
                   avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                   avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                   avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                   avatarImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
                   avatarImageView.widthAnchor.constraint(equalToConstant: 100),
               ])
        
        backgroundColor = UIColor.white
        addSubview(cellView)
        cellView.addSubview(titleLabel)
        
        cellView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        cellView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
       
        
        
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        titleLabel.adjustsFontSizeToFitWidth = true
        
        //titleLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    }
}


