//
//  Photos.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import Foundation

struct Photos {
	var id: Int?
	var albumId: Int?
	var title: String?
	var url:String?
	var thumbnailUrl: String?
	
	init(dict: [String:Any]) {
		
		self.id = dict["id"] as? Int ?? 0
		self.albumId = dict["albumId"] as? Int ?? 0
		self.title = dict["title"] as? String ?? ""
		self.url = dict["url"] as? String ?? ""
		self.thumbnailUrl = dict["thumbnailUrl"] as? String ?? ""
		
	}
}
