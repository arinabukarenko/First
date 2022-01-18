//
//  ViewController.swift
//  CatApp
//
//  Created by Арина  on 17.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    var cats: [CatObject] = DataSource.catsArray
    private var dataSource: [[CatObject]]{
        [cats]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
  
    // -MARK: func
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CatTableViewCell.self, forCellReuseIdentifier: "CatTableViewCell")
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// -MARK: extension
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell", for: indexPath) as! CatTableViewCell
        let cat = dataSource[indexPath.section][indexPath.row]
        cell.titleLabel.text = cat.name
        
        DataSource.fetchCatsIdPic(catId: cat.id) { [weak cell] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    cell?.catImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
        return cell
    }
}
