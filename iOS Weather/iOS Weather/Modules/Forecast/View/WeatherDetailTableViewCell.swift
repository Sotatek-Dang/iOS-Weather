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
        guard let weather = object as? CurrentWeatherModel else { return }
        let currentWeatherViewModel = CurrentWeatherViewModel()
        currentWeatherViewModel.updateWeatherDetail(weather: weather)
        weatherDetailView.setupWeatherDetail(viewModel: currentWeatherViewModel)
    }
}
