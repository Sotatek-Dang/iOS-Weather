//
//  CurrentWeatherContract.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

protocol ConfirmPasswordContract {
    typealias Model = ConfirmPasswordModelProtocol
    typealias View = ConfirmPasswordViewProtocol
    typealias Presenter = ConfirmPasswordPresenterProtocol
}

protocol ConfirmPasswordModelProtocol {
    func searchCurrentWeather(_ city: String,
                       completion: ((Data, NSError?) -> Void)?)
}

protocol ConfirmPasswordViewProtocol: BaseViewProtocol {
    func set(presenter: ConfirmPasswordContract.Presenter)
    func makeToast(value: String)
}

protocol ConfirmPasswordPresenterProtocol {
    func backScreen()
    func openLogin()
    func deleteAccount(password: String)
}
