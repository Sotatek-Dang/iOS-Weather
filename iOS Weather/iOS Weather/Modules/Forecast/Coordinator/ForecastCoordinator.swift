//
//  ForecastCoordinator.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class ForecastCoordinator: Coordinator {
    func start(data: Any?) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let rootNavigation = delegate.window?.rootViewController as? UINavigationController else {
            return
        }
        
        let forecastNavigationController = ForecastViewController.loadFromNib()
        forecastNavigationController.forecastViewModel.cityName = (data as? String) ?? ""
        rootNavigation.pushViewController(forecastNavigationController, animated: true)
    }
}
