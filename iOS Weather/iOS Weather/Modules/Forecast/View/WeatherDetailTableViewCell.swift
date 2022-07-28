//
//  WeatherDetailTableViewCell.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class WeatherDetailTableViewCell: BaseTableViewCell {

    @IBOutlet weak var weatherDetailView: WeatherDetailView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setupCell(object: Any) {
        guard let parameters = object as? [AnyObject],
              let weather = parameters.first as? CurrentWeatherModel else { return }
        
        let isCelsius = (parameters.last as? Bool) ?? true
        let currentWeatherViewModel = CurrentWeatherViewModel()
        currentWeatherViewModel.isCelcius = isCelsius
        currentWeatherViewModel.updateWeatherDetail(weather: weather)
        weatherDetailView.setupWeatherDetail(viewModel: currentWeatherViewModel)
    }
}
