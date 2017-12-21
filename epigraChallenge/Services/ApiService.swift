//
//  ApiService.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 20.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import Foundation

class Api {
	static let shared = Api()
	
	let albumsUrl = "https://jsonplaceholder.typicode.com/albums"
	let photosUrl = "https://jsonplaceholder.typicode.com/photos?albumId="
	
	func getAlbums(completion: @escaping (_ albums: Albums?) -> ()){
		let session = URLSession.shared
		guard let url = URL(string: albumsUrl) else { return }
		session.dataTask(with: url) { (data, response, err) in
			if let err = err {
				print("Something wrong with fetch Albums...",err.localizedDescription)
				return
			}
			guard let data = data else { return }
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
				
				guard let dict = json as? [[String:Any]] else { return }
				for data in dict {
					
					let album = Albums(dict: data)
					completion(album)
				}
			
			}catch let err {
				print("Something went wrong...",err.localizedDescription)
			}
		}.resume()
	}
	
	func getPhotosByAlbumId(albumId: Int?, completion: @escaping (_ photos: Photos?) -> ()){
		guard let albumId = albumId else { return }
		guard let photoUrls = URL(string:photosUrl + String(albumId)) else { return }
		
		let session = URLSession.shared
		session.dataTask(with: photoUrls) { (data, response, err) in
			if let err = err {
				print("Something went wrong with fetching photos...",err.localizedDescription)
				return
			}
			guard let data = data else { return }
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
				guard let dict = json as? [[String:Any]] else { return }
				for data in dict {
					let photos = Photos(dict: data)
					completion(photos)
				}
			}catch let err {
				print("Something went wrong...",err.localizedDescription)
			}
			
			
		}.resume()
	}
}
