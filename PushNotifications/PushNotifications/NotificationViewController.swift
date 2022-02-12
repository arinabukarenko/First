//
//  NotificationViewController.swift
//  PushNotifications
//
//  Created by Арина  on 11.02.22.
//

import UIKit
import UserNotifications



class NotificationViewController: UIViewController {
    
    let button = UIButton()
    let textLabel = UILabel()
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        settingsButton()
        setupLabel()        
        
    }
    func settingsButton() {
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .black
        button.setTitle("Open Settings", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(buttonTapped(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 40
        view.addSubview(button)
        
        
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    func setupLabel() {
        textLabel.backgroundColor = .clear
        textLabel.text = "Notifications are enabled. Please enable them in settings."
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
                         
    @objc func buttonTapped(sender: Any) {
        let isRegisteredForRemoteNotifications = UIApplication.shared.isRegisteredForRemoteNotifications
        if !isRegisteredForRemoteNotifications {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
            
        }
    }
