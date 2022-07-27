//
//  CurrentWeatherCoordinator.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class CurrentWeatherCoordinator: Coordinator {
    func start(data: Any?) {
        guard let window = data as? UIWindow else {
            return
        }
        
        let currentWeatherNavigationController = CurrentWeatherViewController.getNavigationViewController()

        window.rootViewController = currentWeatherNavigationController
        window.makeKeyAndVisible()
    }
}
