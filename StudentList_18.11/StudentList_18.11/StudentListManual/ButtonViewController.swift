//
//  ButtonViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 26.11.21.
//

import UIKit



class ButtonViewController: UIViewController {
    var selectButton:UIButton = UIButton()
    var newTableView = UITableView()
    

    
    override func viewDidLoad() {
        createButton()
        setupNewTableView()
        super.viewDidLoad()
        newTableView.backgroundColor = .white
        self.view.backgroundColor = .white
        newTableView.dataSource = self
        newTableView.delegate = self
        newTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
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
    func setupNewTableView () {
      
        view.addSubview(newTableView)
        
        newTableView.translatesAutoresizingMaskIntoConstraints = false
        
        newTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        newTableView.bottomAnchor.constraint(equalTo: selectButton.topAnchor).isActive = true
        newTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
    }
        
       
        
    
    
}
extension ButtonViewController: ManualLayoutTableViewControllerDelegate {
    func didSelectStudent(_ student: String) {
        selectButton.setTitle(student, for: .normal)
    }
}
    
extension ButtonViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = newTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        newCell.title.text = ""
        return newCell
    }
}

extension ButtonViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newTableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}
