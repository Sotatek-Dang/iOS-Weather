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
    
    func nextDate(number: Int = 1) -> Date {
        var coms = DateComponents()
        coms.day = number
        return Calendar.current.date(byAdding: coms, to: self)!
    }
}
