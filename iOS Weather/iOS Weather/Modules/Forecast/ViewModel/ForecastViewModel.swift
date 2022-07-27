//
//  ForecastVIewModel.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class ForecastViewModel: NSObject {
    var forecastList = [CurrentWeatherModel]()
    var cityName: String = ""
    
    func getForecastList(completion: @escaping (APIError?) -> ()) {
        WeatherService().getForecast(location: cityName, completion: { [weak self] (forecast, error) in
            guard let self = self else { return }
            self.forecastList = forecast?.list ?? [CurrentWeatherModel]()
            if self.forecastList.count > 5 {
                self.forecastList = Array(self.forecastList[0...4])
            }
            DispatchQueue.main.async {
                completion(error)
            }
        })
    }
}
