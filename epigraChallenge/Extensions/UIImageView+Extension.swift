//
//  UIImageView+Extension.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

var imageCache = [String: UIImage]()

class CachedImageView: UIImageView
{
	var lastURLUsedToLoadImage: String?
	func loadImage(urlString: String){
		
		lastURLUsedToLoadImage = urlString
		
		if let cachedImage = imageCache[urlString]{
			self.image = cachedImage
			return
		}
		
		guard let url = URL(string: urlString) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, err) in
			if let err = err {
				print("Failed to fetch post image",err)
				return
			}
			
			if url.absoluteString != self.lastURLUsedToLoadImage {
				return
			}
			
			guard let imageData = data else {return}
			let photoImage = UIImage(data: imageData)
			imageCache[url.absoluteString] = photoImage
			
			DispatchQueue.main.async {
				self.image = photoImage
			}
			}.resume()
	}
}
