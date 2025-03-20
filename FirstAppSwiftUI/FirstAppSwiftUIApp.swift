//
//  FirstAppSwiftUIApp.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 17/3/25.
//

import SwiftUI
import UserNotifications

@main
struct FirstAppSwiftUIApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL { url in
                
            }
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
}
