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
              let rootNavigation = delegate.window?.rootViewController as? UINavigationController,
              let parameters = data as? [AnyObject] else {
            return
        }
        
        let forecastNavigationController = ForecastViewController.loadFromNib()
        forecastNavigationController.forecastViewModel.cityName = (parameters.first as? String) ?? ""
        forecastNavigationController.forecastViewModel.isCelsius = (parameters.last as? Bool) ?? true
        rootNavigation.pushViewController(forecastNavigationController, animated: true)
    }
}
