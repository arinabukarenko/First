//
//  ButtonViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 26.11.21.
//

import UIKit

class ButtonViewController: UIViewController {
    
    
  
    var selectButton:UIButton = UIButton()
    func buttonTapped(){
    let storyboard = ManualLayoutTableViewController()
        let vc = storyboard.storyboard?.instantiateViewController(withIdentifier: "ManualLayoutTableViewCotroller") as! ManualLayoutTableViewController
        vc.delegate = self
        
    }

    
    
    override func viewDidLoad() {
        createButton()
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    func createButton() {
        let button = UIButton(type: .system)
        
        button.setTitle("name", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        button.addTarget(self, action: #selector(handlePresentingVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }

  
    
    @objc func handlePresentingVC(_ sender: UIButton) {
        let vc = ManualLayoutTableViewController()
        present(vc, animated: true, completion: nil)
    }
    
    
}
extension ButtonViewController: ManualLayoutTableViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        selectButton.setTitle(student, for: .normal)
    }
}
