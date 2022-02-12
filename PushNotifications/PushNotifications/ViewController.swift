//
//  ViewController.swift
//  PushNotifications
//
//  Created by Арина  on 9.02.22.
//

import UIKit



class ViewController: UIViewController {
    
    let notificationVC = NotificationViewController()
    let saveData = SaveUserText()
    
    let notificationTitle = UITextField()
    let subtitle = UITextField()
    let textField = UITextField()
    let timePicker = UIDatePicker()
    let defaults = UserDefaults.standard
    
     // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwitch()
        setupLabel()
        setupNotificationTime()
        setupNotificationTitle()
        setupNotificationSubtitle()
        view.backgroundColor = UIColor.purple
        
    }
    // MARK: - Setup
   func setupSwitch(){
        let switchButton = UISwitch(frame:CGRect(x: 300, y: 160, width: 0, height: 0))
        switchButton.addTarget(self, action: #selector (self.switchSelected), for: .valueChanged)
        switchButton.setOn(false, animated: false)
        
        view.addSubview(switchButton)
        
    }
    func setupLabel(){
        let label = UILabel(frame: CGRect(x: view.frame.origin.x, y: 150, width: 200, height: 50))
        label.text = "Allow Notifications"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        
        view.addSubview(label)
    }
    
    func setupNotificationTime(){
        textField.frame = CGRect(x: view.frame.origin.x, y: 250, width: view.frame.width, height: 50)
        textField.backgroundColor = .clear
        textField.text = "Notification Time"
        textField.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        textField.textColor = .white
        view.addSubview(textField)
        
        timePicker.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .compact
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: .valueChanged)
       
        textField.addSubview(timePicker)
    }
    
    func setupNotificationTitle() {
        notificationTitle.frame = CGRect(x: view.bounds.origin.x, y: 290, width: view.bounds.width, height: 50)
        notificationTitle.textColor = .white
        notificationTitle.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        notificationTitle.textColor = .white
        notificationTitle.backgroundColor = .clear
        notificationTitle.attributedPlaceholder = NSAttributedString(
            string: "Enter Title Text:",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        notificationTitle.text = ""
        
        SaveUserText.titleText = notificationTitle.text

        print(SaveUserText.titleText)
        view.addSubview(notificationTitle)
    }
    
    func setupNotificationSubtitle() {
        subtitle.frame =  CGRect(x: view.bounds.origin.x, y: 340, width: view.bounds.width, height: 50)
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        subtitle.attributedPlaceholder = NSAttributedString(
            string: "Enter Subtitle Text:",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        subtitle.text = ""
        subtitle.backgroundColor = .clear
       
        
        view.addSubview(subtitle)
    }
   
    
    // MARK: - OBJC Func
    @objc func timePickerValueChanged(sender: UIDatePicker){
        let rootVC = UIViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func switchSelected(_ sender: UISwitch!) {
        if (sender.isOn == true) {
            navigationController?.pushViewController(notificationVC, animated: true)
            textField.isUserInteractionEnabled = true
            notificationTitle.isUserInteractionEnabled = true
            subtitle.isUserInteractionEnabled = true
            timePicker.isUserInteractionEnabled = true
            print("UISWitch state is now ON")
        } else {
            textField.isUserInteractionEnabled = false
            notificationTitle.isUserInteractionEnabled = false
            subtitle.isUserInteractionEnabled = false
            timePicker.isUserInteractionEnabled = false
            
            print("UISwitch state is now OFF")
        }
    }
}


