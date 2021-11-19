//
//  ViewController.swift
//  StudentList_18.11
//
//  Created by Арина  on 18.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    /*var dataSource = ["Aртимович Игорь Владимирович",
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
                      "Елисеева Марина Михайловна"]*/
    var men = ["Aртимович Игорь Владимирович",
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
         "Сысов Валерий Александрович"]
    
       var women = ["Букаренко Арина Олеговна",
         "Ефименко Анастасия Владимировна",
         "Пернацкая Алеся Юрьевна",
         "Сандова Галина Александровна",
         "Елисеева Марина Михайловна"]
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        men.sort(by: {$0 < $1})
           NSLog("\(men)")
        women.sort(by: {$0 < $1})
        NSLog("\(women)")
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
        return men.count
        }else  if section == 1{
            return women.count
        }
        return men.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerTitle : String?
        if section == 0{
            headerTitle =  "Мужчины \(men.count)"
    }
        if section == 1{
            
            headerTitle = "Женщины"
        }
        return headerTitle
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        firstCell.nameLabel.text = men[indexPath.row]
            return firstCell
        }else{
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
            secondCell.nameLabel.text = women[indexPath.row]
            return secondCell
        }
        
    }
    
}
