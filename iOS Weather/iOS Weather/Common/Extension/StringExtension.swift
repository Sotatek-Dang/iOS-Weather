//
//  StringExtension.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

extension String {
    func getPlistString(resourceName: String) -> Any? {
        guard let infoPlistPath = Bundle.main.url(forResource: resourceName, withExtension: "plist") else {
            return nil
        }
        var resources: [String: Any]?
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            
            if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                resources = dict
            }
        } catch {
            print(error)
        }
        
        return resources?[self]
    }
}
