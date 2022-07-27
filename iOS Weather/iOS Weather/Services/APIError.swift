//
//  APIError.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

struct APIError: Error {
    var message: String = ""
    var code: Int = 0
    var error: Error?
}
