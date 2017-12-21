//
//  ImageDetailVC.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

class ImageDetailVC: UIViewController {
	
	var photo: Photos? {
		didSet{
			guard let photoUrl = photo?.url else { return }
			photoView.loadImage(urlString: photoUrl)
			photoTitle.text = photo?.title
		}
	}
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let photoView: CachedImageView = {
		let iv = CachedImageView()
		iv.contentMode = .scaleAspectFill
		iv.clipsToBounds = true
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	let photoTitle: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.sizeToFit()
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.sizeToFit()
		label.numberOfLines = 0
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		view.addSubview(containerView)
		setupUI()
	}
	
	fileprivate func setupUI(){
		containerView.topAnchor.constraint(equalTo: view.safeTopAnchor).isActive = true
		containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		
		containerView.addSubview(photoView)
		photoView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom:0, paddingRight: 20, height: 0, width: 0)
		photoView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.9).isActive = true
		containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
		view.addSubview(photoTitle)
		photoTitle.anchor(top: containerView.bottomAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 16, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 0, width: 0)
	}
}
