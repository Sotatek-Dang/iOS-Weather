//
//  WeatherModel.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

struct ForecastWeatherModel: Decodable {
    let list: [CurrentWeatherModel]?
}

struct CurrentWeatherModel: Decodable {
    
    let weather: [Weather]?
    let coord: Coordinates?
    let base: String? ///Internal paramenter for station information
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Double?
    let sys: Sys?
    let cityId: Int?
    var cityName: String? ///City name
    let statusCode: Int? /// cod - Internal parameter for HTTP Response
    var dtString: String?
    
    struct Coordinates: Decodable {
        let lon: Double?
        let lat: Double?
    }
    
    struct Wind: Decodable {
        let speed: Double?
        let deg: Int?
    }
    
    struct Clouds: Decodable {
        let all: Int? /// Percentage Value
    }
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case coord
        case base
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case cityId = "id"
        case cityName = "name"
        case statusCode = "cod"
        case dtString = "dt_txt"
    }
}

struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Main: Decodable {
    let tempKelvin: Double?
    var tempFahrenheit: Double {
        return getFahrenheit(valueInKelvin: self.tempKelvin)
    }
    var tempCelcius: Double {
        return getCelsius(valueInKelvin: self.tempKelvin)
    }
    let pressure: Int?
    let humidity: Int?
    let minTempKelvin: Double? /// used for large cities
    let maxTempKelvin: Double?
    
    private enum CodingKeys: String, CodingKey {
        case tempKelvin = "temp"
        case pressure
        case humidity
        case minTempKelvin = "temp_min"
        case maxTempKelvin = "temp_max"
    }
}

struct Sys: Decodable {
    let type: Int?
    let id: Int?
    let message: Double?
    let country: String?
    let sunrise: Double?
    let sunset: Double?
}

extension Main {
    //Calculate Celcius and Fahrenheit Values
    func getFahrenheit(valueInKelvin: Double?) -> Double {
        if let kelvin = valueInKelvin {
            return ((kelvin - 273.15) * 1.8) + 32
        } else {
            return 0
        }
    }
    
    func getCelsius(valueInKelvin: Double?) -> Double {
        if let kelvin = valueInKelvin {
            return kelvin - 273.15
        } else {
            return 0
        }
    }
    
    var minTempFahrenheit: Double {
        return getFahrenheit(valueInKelvin: self.minTempKelvin)
    }
    var minTempCelcius: Double {
        return getCelsius(valueInKelvin: self.minTempKelvin)
    }
    var maxTempFahrenheit: Double {
        return getFahrenheit(valueInKelvin: self.maxTempKelvin)
    }
    var maxTempCelcius: Double {
        return getCelsius(valueInKelvin: self.maxTempKelvin)
    }
}

extension CurrentWeatherModel {
    var timeOfDataCalculation: Date {
        return Date(timeIntervalSince1970: self.dt!)
    }
}

extension Sys {
    var sunriseTime: Date {
        return Date(timeIntervalSince1970: self.sunrise!)
    }
    
    var sunsetTime: Date {
        return Date(timeIntervalSince1970: self.sunset!)
    }
}
