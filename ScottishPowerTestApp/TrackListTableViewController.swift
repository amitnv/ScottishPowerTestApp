//
//  TrackListTableViewController.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
    private var trackListViewModel: TrackListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchTracks()
    }
    
    private func fetchTracks() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=rock") else {return}
        Network().getTracks(url: url) { tracks in
            let noOfResults = tracks?.count
            if let tracks = tracks {
                self.trackListViewModel = TrackListViewModel(resultCount: noOfResults!, results: tracks)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

