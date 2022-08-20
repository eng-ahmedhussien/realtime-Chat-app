//
//  AppDelegate.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 28/12/1443 AH.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { sucess, error in
            if sucess{
               print("sucess")
            }
        }
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    // MARK: NotificationCenter willPresent
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound])
    }
    // MARK: NotificationCenter didReceive
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("clicked")
        UIApplication.shared.applicationIconBadgeNumber = 0

    }
    func chatNotification(){
        let content = UNMutableNotificationContent()
        content.title = "chat"
        content.subtitle = "room"
        content.body = "body"
        content.sound = .default
        content.badge = 1
       
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5), repeats: false)
        let request = UNNotificationRequest(identifier: "id1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

