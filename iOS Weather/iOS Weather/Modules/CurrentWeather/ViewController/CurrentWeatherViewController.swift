//
//  CurrentWeatherViewController.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit
import SVProgressHUD

class CurrentWeatherViewController: BaseViewController {

    @IBOutlet weak private var cancelButton: UIButton!
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var weatherDetailView: WeatherDetailView!
    @IBOutlet weak private var noDataLabel: UILabel!
    private let currentWeatherViewModel = CurrentWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: - Setup View
    override func setupUI() {
        super.setupUI()
        addTitle(title: "Weather")
        addLeftBarItem(imageName: "menu", selectedImage: "menu", title: "")
    }
    
    private func updateWeatherDetail(error: APIError?) {
        if error != nil {
            removeRightButton()
        } else {
            addRightBarItem(imageName: "", imageTouch: "", title: "Forecast")
        }
        
        weatherDetailView.isHidden = (error != nil)
        noDataLabel.isHidden = !weatherDetailView.isHidden
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
    
    @IBAction func cancelSearching(_ sender: UIButton) {
        searchTextField.text = ""
        weatherDetailView.isHidden = true
        noDataLabel.isHidden = false
        cancelButton.isHidden = true
        searchTextField.resignFirstResponder()
    }
}

// MARK: - Textfield delegate
extension CurrentWeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cancelButton.isHidden = true
    }
    
    private func search() {
        searchTextField.resignFirstResponder()
        guard let locationName = searchTextField.text, !locationName.isEmpty else {
            return
        }
        SVProgressHUD.show()
        currentWeatherViewModel.getCurrentWeather(location: locationName, completion: { [weak self] error in
            SVProgressHUD.dismiss()
            guard let self = self else { return }
            self.updateWeatherDetail(error: error)
        })
    }
}
