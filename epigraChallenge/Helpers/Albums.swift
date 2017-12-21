//
//  Albums.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 20.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import Foundation

struct Albums {
	var userId: Int?
	var id: Int?
	var title: String?
	
	init(dict: [String:Any]){
		self.userId = dict["userId"] as? Int ?? 0
		self.id = dict["id"] as? Int ?? 0
		self.title = dict["title"] as? String ?? ""
	}
}
