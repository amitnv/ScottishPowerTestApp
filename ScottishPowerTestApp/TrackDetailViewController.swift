//
//  TrackDetailViewController.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import UIKit

class TrackDetailViewController: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var trackName:UILabel!
    @IBOutlet weak var artistLabel:UILabel!
    @IBOutlet weak var trackPriceLabel:UILabel!
    @IBOutlet weak var durationLabel:UILabel!
    @IBOutlet weak var releaseDateLabel:UILabel!
    @IBOutlet weak var songImageView:UIImageView!
    @IBOutlet weak var moreDetailsButton: UIButton!
    @IBOutlet weak var trackDetailsStackView: UIStackView!
    
    var trackDetailViewModel: TrackDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
