//
//  UIImageView + Extension.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 17.04.2022.
//

import UIKit

var imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    
    func loadImage(urlString: String) {
        
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    self.image = image
                }
            }
        }
        
    }
    
}
