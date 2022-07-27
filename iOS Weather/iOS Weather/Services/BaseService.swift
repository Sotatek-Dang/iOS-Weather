//
//  BaseService.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class BaseService: NSObject {
    
    // Generate url for getting current weather
    func generateSearchUrl(path: String, location: String) -> URL? {
        let query = "q"
        let key = URLQueryItem(name: "APPID", value: apiKey)
        //MARK: URL EndPoints
        var baseURL = URLComponents(string: path)
        let searchString = URLQueryItem(name: query, value: location)
        
        baseURL?.queryItems?.append(searchString)
        baseURL?.queryItems?.append(key)
        return baseURL?.url
    }
    
    // Decode response
    private func decodeData<T: Decodable>(_ data: Data?, responseDataType: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let existData = data else {
            return nil
        }
        
        do {
            let rawData = try decoder.decode(T.self, from: existData)
            return rawData
        } catch {
            return nil
        }
    }
    
    func request<T: Decodable>(to url: URL, objectType: T.Type, completion: @escaping (T?, APIError?) -> ()) {
        if !Reachability.isConnectedToNetwork() {
            completion(nil, APIError(message: "No internet", code: 601))
            return
        }
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let existData = data, let existObject = self.decodeData(existData, responseDataType: T.self) else {
                    completion(nil, APIError(error: error))
                    return
                }
                completion(existObject, nil)
            }.resume()
        }
    }
}
