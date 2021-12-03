//
//  TrackDetailViewModel.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import Foundation

struct TrackDetailViewModel {
    private let result: Result
}

extension TrackDetailViewModel {
    init(_ result: Result) {
        self.result = result
    }
}
extension TrackDetailViewModel {

    var name: String {
        return self.result.trackName
    }
    var artist: String {
        return self.result.artistName
    }
    var currency: String {
        return self.result.currency
    }
    var artwork: String {
        return self.result.artworkUrl100
    }

    var url: String {
        return self.result.trackViewUrl
    }
}
