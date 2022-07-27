//
//  ServiceEnvironment.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

// TODO: - Need to config target while developing
let plistFileName = "Service"
let apiKey = "apiKey".getPlistString(resourceName: plistFileName) as? String
let domain = "domain".getPlistString(resourceName: plistFileName) ?? ""
let forecastURL = "\(domain)/forecast?"
let weatherURL = "\(domain)/weather?"
