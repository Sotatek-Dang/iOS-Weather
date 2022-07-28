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
    var isCelsius: Bool = true

    func getForecastList(completion: @escaping (APIError?) -> ()) {
        WeatherService().getForecast(location: cityName, completion: { [weak self] (forecast, error) in
            guard let self = self else { return }
            self.forecastList = forecast?.list ?? [CurrentWeatherModel]()
  
            // Only get daily result for 12:00:00 
            self.forecastList = self.forecastList.filter({($0.dtString ?? "").contains("12:00:00")})
            DispatchQueue.main.async {
                completion(error)
            }
        })
    }
}
