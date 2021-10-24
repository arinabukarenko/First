//
//  ViewController.swift
//  Homework
//
//  Created by Арина  on 24.10.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Button1(_ sender: Any) {
        counter += 1
        Label.text = "Counter: \(counter)"
    }
    
    @IBAction func Button2(_ sender: Any) {
        counter -= 1
        Label.text = "Counter: \(counter)"
    }
    

}

