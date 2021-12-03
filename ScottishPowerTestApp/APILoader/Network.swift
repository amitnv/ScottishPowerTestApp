//
//  Network.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import Foundation

class Network {
    func getTracks(url: URL, completion: @escaping ([Result]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                    let resultList = try? JSONDecoder().decode(Tracks.self, from: data)
                    if let resultList = resultList {
                        let sortedArray = resultList.results.sorted { $0.releaseDate > $1.releaseDate }
                        completion(sortedArray)
                    }
            }
        }.resume()
    }
}
