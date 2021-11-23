//
//  ManualLayoutTableViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 21.11.21.
//

import UIKit

class ManualLayoutTableViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    let tableView = UITableView()
    private var searchController = UISearchController()
    var filteresNames: [String]!
    
    
    
    var male = ["Aртимович Игорь Владимирович",
                "Богданович Дмитрий Александрович",
                "Гришин Павел Андреевич",
                "Куклицкий Максим Сергеевич",
                "Лапин Николай Владимирович",
                "Малишевский Никита Валерьевич",
                "Матвеенко Сергей Александрович",
                "Мостовой Алексей Алексеевич",
                "Пачковский Михаил Тадеушевич",
                "Савков Александр Геннадьевич",
                "Симонов Владислав Дмитриевич",
                "Сысов Валерий Александрович"].sorted()
    
    var female = ["Букаренко Арина Олеговна",
                  "Ефименко Анастасия Владимировна",
                  "Пернацкая Алеся Юрьевна",
                  "Сандова Галина Александровна",
                  "Елисеева Марина Михайловна"].sorted()
    
    lazy var students: [String] = male + female
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        filteresNames = students
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.tintColor = UIColor.black
        view.backgroundColor = .white
        
        tableView.register(NewStudentCell.self, forCellReuseIdentifier: "NewStudentCell")
        
        setupTableView()
    }
    // MARK: - Setup View
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        
    }
    
}
// MARK: - Extension

extension ManualLayoutTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return filteresNames.count
        }
        return filteresNames.count}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Женщины \(female.count)"
        }
        return "Мужчины \(male.count)"
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewStudentCell", for: indexPath) as! NewStudentCell
        cell.titleLabel.text = filteresNames[indexPath.row]
        if indexPath.section == 1{
            cell.titleLabel.text = filteresNames[indexPath.row]
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteresNames = []
        if searchText == "" {
            filteresNames = students
        }else{
            for students1 in students {
                if students1.contains(searchText){
                    filteresNames.append(students1)
                }
            }
        }
        self.tableView.reloadData()
    }
}
