//
//  TangeriaCourseworkApp.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 09/05/2024.
//

import SwiftUI
import Firebase

@main
struct TangeriaCourseworkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Configure successfully")
        
        return true
    }
}

