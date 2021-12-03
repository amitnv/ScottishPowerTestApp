//
//  TrackDetailViewController.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 02/12/2021.
//

import UIKit
import SafariServices
class TrackDetailViewController: UIViewController, SFSafariViewControllerDelegate {
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
        loadTrackInformation()
        
    }
    func loadTrackInformation() {
        
        trackName.text = trackDetailViewModel.name
        artistLabel.text = trackDetailViewModel.artist
        trackPriceLabel.text = returnFormattedText(labelName: "Price", modelData: trackDetailViewModel.price)
        durationLabel.text = returnFormattedText(labelName: "Duration", modelData: trackDetailViewModel.duration)
        releaseDateLabel.text = returnFormattedText(labelName: "Released", modelData: trackDetailViewModel.release)
        moreDetailsButton.setTitle("More Details", for: .normal)
        songImageView.loadImage(withUrl: trackDetailViewModel.artwork)
    }
    
    func returnFormattedText(labelName: String, modelData: String) -> String {
        return "\(labelName) : \(modelData)"
    }
    
    @IBAction func moreDetailsButtonTapped(_ sender: Any) {
        guard let trackUrl = trackDetailViewModel?.url else {
            showAlert(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }

        guard let url = URL(string: trackUrl) else {
            showAlert(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemPink
        safariViewController.delegate = self

        present(safariViewController, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
