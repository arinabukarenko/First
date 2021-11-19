//
//  ViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 18.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ["Aртимович Игорь Владимирович",
                      "Богданович Дмитрий Александрович",
                      "Букаренко Арина Олеговна",
                      "Гришин Павел Андреевич",
                      "Ефименко Анастасия Владимировна",
                      "Куклицкий Максим Сергеевич",
                      "Лапин Николай Владимирович",
                      "Малишевский Никита Валерьевич",
                      "Матвеенко Сергей Александрови",
                      "Мостовой Алексей Алексеевич",
                      "Пачковский Михаил Тадеушевич",
                      "Пернацкая Алеся Юрьевна",
                      "Савков Александр Геннадьевич",
                      "Сандова Галина Александровна",
                      "Симонов Владислав Дмитриевич",
                      "Сысов Валерий Александрович",
                      "Елисеева Марина Михайловна"]
    
    var students = [
        ["Aртимович Игорь Владимирович",
         "Богданович Дмитрий Александрович",
         "Гришин Павел Андреевич",
         "Куклицкий Максим Сергеевич",
         "Лапин Николай Владимирович",
         "Малишевский Никита Валерьевич",
         "Матвеенко Сергей Александрови",
         "Мостовой Алексей Алексеевич",
         "Пачковский Михаил Тадеушевич",
         "Савков Александр Геннадьевич",
         "Симонов Владислав Дмитриевич",
         "Сысов Валерий Александрович"],
        ["Букаренко Арина Олеговна",
         "Ефименко Анастасия Владимировна",
         "Пернацкая Алеся Юрьевна",
         "Сандова Галина Александровна",
         "Елисеева Марина Михайловна"]
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Мужчины "
        } else{
            return "Женщины"
        }}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        cell.nameLabel.text = students[indexPath.section][indexPath.row]
       
        
        return cell

    
        
    }
   
    
}

