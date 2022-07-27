//
//  ForecastViewController.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class ForecastViewController: BaseViewController {

    @IBOutlet weak private var noDataLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView!
    private var tableViewDelegate: BaseTableViewDelegate<WeatherDetailTableViewCell>?
    private let forecastViewModel = ForecastViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup View
    override func setupUI() {
        super.setupUI()
        addTitle(title: "5-Day forcast for \(forecastViewModel.cityName)")
        addLeftBarItem(imageName: "ico_back", selectedImage: "ico_back", title: "")
        
        // Setup TableView
        tableViewDelegate = BaseTableViewDelegate(hasPull: false, hasLoadMore: false, tableView: self.tableView)
        tableViewDelegate?.setupCell    = setupCell(indexPath:dataItem:cell:)
    }
    
    override func loadData() {
        forecastViewModel.getForecastList(completion: { [weak self] error in
            guard let self = self else { return }
            self.noDataLabel.isHidden = self.forecastViewModel.forecastList.isEmpty
            self.tableViewDelegate?.dataArray = [self.forecastViewModel.forecastList]
        })
    }
    
    // MARK: - TableView delegate, datasource
    private func setupCell(indexPath: IndexPath, dataItem: Any, cell: UITableViewCell) {
        // TODO: Setup UI for cell
        if let weatherCell = cell as? WeatherDetailTableViewCell {
            weatherCell.setupCell(object: dataItem)
        }
    }
}
