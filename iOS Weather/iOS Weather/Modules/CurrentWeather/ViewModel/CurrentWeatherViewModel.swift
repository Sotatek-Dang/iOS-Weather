//
//  CurrentWeatherViewModel.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class CurrentWeatherViewModel: NSObject {
    var isCelcius = true
    var detail = WeatherDetail()
    
    func getCurrentWeather(location: String, completion: @escaping (APIError?) -> ()) {
        WeatherService().getCurrentWeather(location: location, completion: { [weak self] (weather, error) in
            guard let self = self else { return }
            self.updateWeatherDetail(weather: weather)

            DispatchQueue.main.async {
                completion(error)
            }
        })
    }
    
    func updateWeatherDetail(weather: CurrentWeatherModel?) {
        guard let existWeather = weather else { return }
        
        // Detect status image
        self.detail.statusImage = existWeather.weather?.first?.icon ?? "background_default"
        self.detail.timeImage   = "\(self.detail.statusImage)-1"
        self.detail.statusImage = "\(self.detail.statusImage)-2"
        self.detail.cityName = existWeather.cityName ?? ""
        
        if let humidity = existWeather.main?.humidity {
            self.detail.humidity = "\(humidity)%"
        }
        
        if let celcius = existWeather.main?.tempCelcius {
            self.detail.celcius = "\(Int(celcius))°C"
        }
        
        if let fahrenheit = existWeather.main?.tempFahrenheit {
            self.detail.fahrenheit = "\(Int(fahrenheit))°F"
        }
    }
}

struct WeatherDetail {
    var cityName: String = ""
    var fahrenheit: String = ""
    var celcius: String = ""
    var humidity: String = ""
    var statusImage: String = ""
    var timeImage: String = ""
}
