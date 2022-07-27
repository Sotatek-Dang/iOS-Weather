//
//  SelectionView.swift
//  iOS Weather
//
//  Created by Beacon on 28/07/2022.
//

import UIKit

class TemperatureSelectionView: BaseView {

    @IBOutlet weak var fahrenheitTickImageView: UIImageView!
    @IBOutlet weak var celsiusButton: UIButton!
    @IBOutlet weak var celsiusTickImageView: UIImageView!
    @IBOutlet weak var fahrenheitButton: UIButton!
    var selectedCallBack: ((Bool) -> Void)?
    
    // MARK: Actions
    @IBAction func tappedCancel(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func tappedFahrenheit(_ sender: UIButton) {
        self.removeFromSuperview()
        if let callBack = selectedCallBack {
            callBack(false)
        }
    }
    
    @IBAction func tappedCelsius(_ sender: UIButton) {
        self.removeFromSuperview()
        if let callBack = selectedCallBack {
            callBack(true)
        }
    }
    
    static func showTemperatureSelectionView(isCelsius: Bool = true, onSelected: @escaping (Bool) -> Void) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let window = delegate.window else {
            return
        }
        let tempView = TemperatureSelectionView()
        tempView.frame = window.frame
        tempView.celsiusTickImageView.isHidden = !isCelsius
        tempView.fahrenheitTickImageView.isHidden = isCelsius
        tempView.selectedCallBack = onSelected
        window.addSubview(tempView)
    }
}
