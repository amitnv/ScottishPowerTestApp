//
//  TracksTableViewCell.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import UIKit

class TracksTableViewCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var boxView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadTrackInformation(track: TrackDetailViewModel) {
        artworkImageView.loadImage(withUrl: track.artwork)
    }
    
}
