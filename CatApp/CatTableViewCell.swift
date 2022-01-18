//
//  CatTableViewCell.swift
//  CatApp
//
//  Created by Арина  on 18.01.22.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    
    let catImageView = UIImageView()
    
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
    
    func setup() {
        
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(catImageView)
        catImageView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            catImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            catImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            catImageView.widthAnchor.constraint(equalToConstant: 100),
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
        titleLabel.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        titleLabel.adjustsFontSizeToFitWidth = true
    }
}
