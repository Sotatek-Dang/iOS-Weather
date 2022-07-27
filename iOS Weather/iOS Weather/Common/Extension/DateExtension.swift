//
//  DateExtension.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

extension Date {
    func getDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
