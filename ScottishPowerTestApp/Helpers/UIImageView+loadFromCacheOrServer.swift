//
//  UIImageView+loadFromCacheOrServer.swift
//  ScottishPowerTestApp
//
//  Created by Amit Vaidya on 03/12/2021.
//

import UIKit

//Temporary cache
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    //Future improvement: Move to a CoreData approach and save a compressed image
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = UIImage(named: "Thumbnail")

        // check if image exists in cache
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            
            return
        }

        // if the image don't exists, download from url
        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "Thumbnail")
                }
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    
                    self.image = image
                }
            }
        }).resume()
    }
    
}
