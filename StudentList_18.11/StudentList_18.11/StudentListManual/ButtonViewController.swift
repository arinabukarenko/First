//
//  ButtonViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 26.11.21.
//

import UIKit

class ButtonViewController: UIViewController {
    
    
  
    var selectButton:UIButton = UIButton()
//    func buttonTapped(){
//    let storyboard = ManualLayoutTableViewController()
//        let vc = storyboard.storyboard?.instantiateViewController(withIdentifier: "ManualLayoutTableViewCotroller") as! ManualLayoutTableViewController
//        vc.delegate = self
//        
//    }

    
    
    override func viewDidLoad() {
        createButton()
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    func createButton() {
        let button = UIButton(type: .system)
        
        button.setTitle("student", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(handlePresentingVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.sizeToFit()
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
        
        selectButton = button
        
    }
 @objc func handlePresentingVC(_ sender: UIButton) {
        let vc = ManualLayoutTableViewController()
     vc.delegate = self
     
        present(vc, animated: true, completion: nil)
    }
    
    
}
extension ButtonViewController: ManualLayoutTableViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        selectButton.setTitle(student, for: .normal)
    }
}
