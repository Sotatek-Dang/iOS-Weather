//
//  CurrentWeatherViewController.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class CurrentWeatherViewController: BaseViewController {

    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var weatherDetailView: WeatherDetailView!
    private let currentWeatherViewModel = CurrentWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup View
    override func setupUI() {
        super.setupUI()
        addTitle(title: "Weather")
        addLeftBarItem(imageName: "menu", selectedImage: "menu", title: "")
        addRightBarItem(imageName: "", imageTouch: "", title: "Forecast")
    }
    
    private func updateWeatherDetail() {
        weatherDetailView.isHidden = false
        self.weatherDetailView.setupWeatherDetail(viewModel: currentWeatherViewModel)
    }
    
    private func updateTemperatureUnit(isCelcius: Bool) {
        currentWeatherViewModel.isCelcius = isCelcius
        self.weatherDetailView.setupWeatherDetail(viewModel: currentWeatherViewModel)
    }
    
    // MARK: - Actions
    override func tappedLeftBarButton(sender: UIButton) {
        // Show menu
        showActionSheet(selectionArray: menuOptions, onTapped: { [weak self] selectedOption in
            guard let self = self else { return }
            self.updateTemperatureUnit(isCelcius: selectedOption == menuOptions.first)
        }, onCancel: {})
    }
    
    override func tappedRightBarButton(sender: UIButton) {
        ForecastCoordinator().start(data: currentWeatherViewModel.detail.cityName)
    }
}

// MARK: - Textfield delegate
extension CurrentWeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
    
    private func search() {
        searchTextField.resignFirstResponder()
        guard let locationName = searchTextField.text, !locationName.isEmpty else {
            return
        }
        
        currentWeatherViewModel.getCurrentWeather(location: locationName, completion: { [weak self] error in
            guard let self = self else { return }
            self.updateWeatherDetail()
        })
    }
}