//
//  BaseCoordinator.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation

protocol Coordinator: AnyObject {
    func start(data: Any?)
}

extension Coordinator {
    func start(data: Any? = nil) {
        self.start(data: nil)
    }
}
