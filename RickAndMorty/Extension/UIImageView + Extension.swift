//
//  UIImageView + Extension.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
        
    func load(url: URL) {
        
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = image
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
