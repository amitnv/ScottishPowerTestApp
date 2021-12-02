//
//  Tracks.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import Foundation

//Tracks Model
struct Tracks: Decodable {
    let resultCount: Int
    let results: [Result]
    
}

//Result Model
struct Result: Decodable {
    let trackName: String
    let artistName: String
    let trackPrice: Double
    let artworkUrl100: String
    let currency: String
    let trackTimeMillis: Int
    let releaseDate: String
    let trackViewUrl: String
}
