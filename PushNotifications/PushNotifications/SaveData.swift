//
//  saveData.swift
//  PushNotifications
//
//  Created by Арина  on 11.02.22.
//

import Foundation

class SaveUserText {
    
    private enum SettingKeys: String {
        case title
        
    }
    static var titleText: String!{
        get{
            return UserDefaults.standard.object(forKey: SettingKeys.title.rawValue) 
        } set{
            let defaults = UserDefaults.standard
            let key = SettingKeys.title.rawValue
            if let title = newValue {
                print("value \(title) was added to key \(key)")
                defaults.set(title, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
