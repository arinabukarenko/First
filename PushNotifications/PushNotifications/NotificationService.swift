//
//  NotificationService.swift
//  PushNotifications
//
//  Created by Арина  on 11.02.22.
//

import UIKit

class NotificationService: NSObject {

    private override init() {}
    static let sharedInstance = NotificationService()
    
    let UNCurrentCenter = UNUserNotificationCenter.current()
    
    func authorizeNotification(){
        let options:UNAuthorizationOptions = [.alert, .sound, .badge]
        UNCurrentCenter.requestAuthorization(options: options) { granted, error in
            print (error ?? "No UNAuthorization error")
            
            guard granted else {
                print("User Denied the permission to recieve Push")
                return
            }
            self.UNCurrentCenter.delegate = self
        }
    }
}
extension NotificationService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didRecieve response")
        completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresent notification")
        let options:UNNotificationPresentationOptions = [.sound]
        completionHandler(options)
    }
}
