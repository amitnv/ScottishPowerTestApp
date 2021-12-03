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
        prettifyCellUI()
    }
    
    func prettifyCellUI() {
        boxView.layer.borderColor = UIColor.systemGray.cgColor
        boxView.layer.cornerRadius = 10
        boxView.layer.borderWidth = 1.0
        artworkImageView.layer.cornerRadius = 5
        artistNameLabel.textColor = UIColor.systemPink
        priceLabel.textColor = UIColor.systemGray
    }
    func loadTrackInformation(track: TrackDetailViewModel) {
        artworkImageView.loadImage(withUrl: track.artwork)
    }
    
}
