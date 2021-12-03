//
//  TrackListViewModel.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import Foundation

struct TrackListViewModel {
    let resultCount: Int
    let results: [Result]
}

extension TrackListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.resultCount
    }
    
    func resultAtIndex(_ index: Int) -> TrackDetailViewModel {
        let result = self.results[index]
        return TrackDetailViewModel(result)
    }
    
    func detailsViewModel(for index: Int) -> TrackDetailViewModel {
        let result = self.results[index]
        return TrackDetailViewModel(result)
    }
}

