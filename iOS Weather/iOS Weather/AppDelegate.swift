//
//  AppDelegate.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Init first window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Init first view controllers
        CurrentWeatherCoordinator().start(data: window)
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }
}

