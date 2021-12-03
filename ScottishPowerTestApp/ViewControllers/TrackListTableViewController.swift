//
//  TrackListTableViewController.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
    private var trackListViewModel: TrackListViewModel!
    var resultViewModel: TrackDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.separatorStyle = .none
        fetchTracks()
    }
    
    private func fetchTracks() {
        guard let url = URL(string: AppConstants.APIEndPoint) else {return}
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.trackListViewModel == nil ? 0 : self.trackListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trackListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TracksTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.TracksTableViewCell, for: indexPath) as? TracksTableViewCell else {
            fatalError("cell not found")
        }
        let tracksVM = self.trackListViewModel.resultAtIndex(indexPath.row)
        
        cell.trackNameLabel.text = tracksVM.name
        cell.artistNameLabel.text = tracksVM.artist
        cell.priceLabel.text = tracksVM.price
        cell.loadTrackInformation(track: tracksVM)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let trackDetailViewController = UIStoryboard.init(name: AppConstants.MainStoryboardIdentifier, bundle: nil).instantiateViewController(withIdentifier: AppConstants.TrackDetailViewController) as? TrackDetailViewController
        let detailsViewModel = self.trackListViewModel.resultAtIndex(indexPath.row)
        trackDetailViewController?.trackDetailViewModel = detailsViewModel
        self.navigationController?.pushViewController(trackDetailViewController!, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
       
    }

}

