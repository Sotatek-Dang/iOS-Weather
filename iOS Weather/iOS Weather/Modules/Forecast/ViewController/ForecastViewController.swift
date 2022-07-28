//
//  ForecastViewController.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit
import SVProgressHUD

class ForecastViewController: BaseViewController {

    @IBOutlet weak private var noDataLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView!
    private var tableViewDelegate: BaseTableViewDelegate<WeatherDetailTableViewCell>?
    let forecastViewModel = ForecastViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup View
    override func setupUI() {
        super.setupUI()
        addTitle(title: "5-Day forcast for \(forecastViewModel.cityName)")
        addLeftBarItem(imageName: "ico_back", selectedImage: "ico_back", title: "")
        
        // Setup TableView
        tableViewDelegate = BaseTableViewDelegate(tableView: self.tableView)
        tableViewDelegate?.setupCell    = setupCell(indexPath:dataItem:cell:)
    }
    
    override func loadData() {
        SVProgressHUD.show()
        forecastViewModel.getForecastList(completion: { [weak self] error in
            SVProgressHUD.dismiss()
            guard let self = self else { return }
            self.noDataLabel.isHidden = !self.forecastViewModel.forecastList.isEmpty
            self.tableViewDelegate?.dataArray = [self.forecastViewModel.forecastList]
        })
    }
    
    // MARK: - TableView delegate, datasource
    private func setupCell(indexPath: IndexPath, dataItem: Any, cell: UITableViewCell) {
        // TODO: Setup UI for cell
        if let weatherCell = cell as? WeatherDetailTableViewCell, var currentWather = dataItem as? CurrentWeatherModel {
            currentWather.cityName = forecastViewModel.cityName
            weatherCell.setupCell(object: [currentWather, forecastViewModel.isCelsius])
        }
    }
}
