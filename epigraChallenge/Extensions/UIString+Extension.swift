//
//  UIString+Extension.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

extension String {
	func height(constraintedWidth width: CGFloat) -> CGFloat {
		let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
		label.numberOfLines = 0
		label.text = self
		label.sizeToFit()
		return label.frame.height
	}
}
