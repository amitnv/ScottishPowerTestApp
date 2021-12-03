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
    var price: String {
        return String("\(Utility.symbolForCurrency(currency: self.result.currency))\(Utility.formatPrice(price: self.result.trackPrice))")
    }
    var duration: String {
        let (hours, minutes, seconds) = Utility.formatSeconds(seconds: self.result.trackTimeMillis / 1000)
        if minutes != 0 {
            return "\(minutes).\(seconds) min"
        }
        if hours != 0 {
            return "\(hours).\(minutes).\(seconds) hr"
        }
        return String(self.result.trackTimeMillis)
    }
    var release: String {
        return Utility.formatDate(date: self.result.releaseDate, formatFrom: "yyyy-MM-dd'T'HH:mm:ss'Z'", formatTo: "dd MMM, yyyy")
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
