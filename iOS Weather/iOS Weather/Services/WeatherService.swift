//
//  WeatherService.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class WeatherService: BaseService {

    func getCurrentWeather(location: String, completion: @escaping (CurrentWeatherModel?, APIError?) -> ()) {
        guard let url = self.generateSearchUrl(path: weatherURL, location: location) else {
            completion(nil, APIError(message: "Can't generate URL", code: 602, error: nil))
            return
        }
        
        self.request(to: url, objectType: CurrentWeatherModel.self, completion: { (weather, error) in
            completion(weather, error)
        })
    }
    
    func getForecast(location: String, completion: @escaping (ForecastWeatherModel?, APIError?) -> ()) {
        guard let url = self.generateSearchUrl(path: forecastURL, location: location) else {
            completion(nil, APIError(message: "Can't generate URL", code: 602, error: nil))
            return
        }
        
        self.request(to: url, objectType: ForecastWeatherModel.self, completion: { (weather, error) in
            completion(weather, error)
        })
    }
}
