//
//  ManualLayoutTableViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 21.11.21.
//

import UIKit

class ManualLayoutTableViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
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
    
    //lazy var students2:[String] = male + female
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
// MARK: - UITableViewDataSource

extension ManualLayoutTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return female.count
        }
            return male.count
        }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Женщины \(female.count)"
        }
            return "Мужчины \(male.count)"
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewStudentCell", for: indexPath) as! NewStudentCell
        cell.titleLabel.text = male[indexPath.row]
        if indexPath.section == 1{
        cell.titleLabel.text = female[indexPath.row]
    }
            return cell
        }
    }
