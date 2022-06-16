//
//  bookKeeperAppApp.swift
//  bookKeeperApp
//
//  Created by gdaalumno on 14/06/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct bookKeeperAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var bookViewModel = BookViewModel()

    
    var body: some Scene {
        WindowGroup {
            HomePageView(bookViewModel: bookViewModel)
        }
    }
}
