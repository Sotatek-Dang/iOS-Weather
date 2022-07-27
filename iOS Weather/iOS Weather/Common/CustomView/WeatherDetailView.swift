//
//  WeatherDetailView.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

@IBDesignable class WeatherDetailView: BaseView {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var timeImageView: UIImageView!
    
    func setupWeatherDetail(viewModel: CurrentWeatherViewModel, isCelcius: Bool = true) {
        // Update current background
        statusImageView.image   = UIImage.init(named: viewModel.detail.statusImage)
        timeImageView.image     = UIImage.init(named: viewModel.detail.timeImage)
        cityNameLabel.text      = viewModel.detail.cityName
        humidityLabel.text      = viewModel.detail.humidity
        temperatureLabel.text   = viewModel.isCelcius ? viewModel.detail.celcius : viewModel.detail.fahrenheit
    }
}
