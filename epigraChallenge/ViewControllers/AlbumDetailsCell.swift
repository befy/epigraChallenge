//
//  AlbumDetailsCell.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

class AlbumDetailsCell: UICollectionViewCell {
	var photo: Photos? {
		didSet{
			title.text = photo?.title
			guard let photoUrl = photo?.thumbnailUrl else { return }
			thumbnail.loadImage(urlString: photoUrl)
		}
	}
	var thumbnail: CachedImageView = {
		let iv = CachedImageView()
		iv.backgroundColor = UIColor.white.withAlphaComponent(0.8)
		iv.contentMode = .scaleAspectFill
		iv.translatesAutoresizingMaskIntoConstraints = false
		iv.clipsToBounds = true
		return iv
	}()
	var title: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = UIColor.white.withAlphaComponent(0.2)
		label.textColor = .white
		label.sizeToFit()
		label.numberOfLines = 0
		return label
	}()
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(thumbnail)
		thumbnail.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 150, width: 0)
		addSubview(title)
		title.anchor(top: thumbnail.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
