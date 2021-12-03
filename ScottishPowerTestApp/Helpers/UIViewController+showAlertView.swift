//
//  UIViewController+showAlertView.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 03/12/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
