//
//  ManualLayoutTableViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 21.11.21.
//

import UIKit

protocol ManualLayoutTableViewControllerDelegate {
    func didSelectStudent(_ student: String)
}

class ManualLayoutTableViewController: UIViewController {
    
    var delegate: ManualLayoutTableViewControllerDelegate?
    
    let tableView = UITableView()
    var searchController = UISearchController()
    var filteredNames: [[String]] {
        [male, female]
    }
    var filteredMale:[String] = []
    var filteredFemale: [ String] = []
    var filterName: [String] = []
    
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
    
    var filterText: String? {
        didSet {
            if let filterText = filterText {
                filterDataSource(filterText)
            } else {
                resetDataSource()
            }
        }
    }
    override func viewDidLoad() {
        tableView.delegate = self
        searchController.searchBar.delegate = self
        super.viewDidLoad()
        
        
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.obscuresBackgroundDuringPresentation = false
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
        tableView.keyboardDismissMode = .onDrag
        filterText = nil
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        
    }
    func resetDataSource() {
        tableView.reloadData()
        print("result")
    }
    
    func filterDataSource(_ filterText:String) {
        if filterText.count > 0 {
            male = male.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
            female = female.filter {
                $0.lowercased().contains(filterText.lowercased())
            }
            tableView.reloadData()
            
        } else if filterText == "" {
            resetDataSource()
            
        }
        
    }
    
}
// MARK: - Extension

extension ManualLayoutTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredNames.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNames[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName: String = ""
        switch section {
        case 0: sectionName = "Мужчины"
        case 1: sectionName = "Женщины"
        default: break
        }
        return "\(sectionName) \(filteredNames[section].count) человек"
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewStudentCell", for: indexPath) as! NewStudentCell
        cell.titleLabel.text = filteredNames[indexPath.section][indexPath.row]
        
        return cell
    }
    
}
extension ManualLayoutTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("selected \(filteredNames[indexPath.section][indexPath.row])")    }
}
extension ManualLayoutTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterText = searchText
    }
    
}

