//
//  AlbumDetailsVC.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 21.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

class AlbumDetailsVC: UICollectionViewController {
	var photos = [Photos]()
	var albumId: Int? {
		didSet{
			guard let id = albumId else { return }
			print(id)
			Api.shared.getPhotosByAlbumId(albumId: id) { (photo) in
				guard let photo = photo else { return }
				self.photos.append(photo)
				
				DispatchQueue.main.async {
					self.collectionView?.reloadData()
				}
			}
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.backgroundColor = .black
		collectionView?.register(AlbumDetailsCell.self, forCellWithReuseIdentifier: "cellId")
	}
}

extension AlbumDetailsVC: UICollectionViewDelegateFlowLayout {
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AlbumDetailsCell
		cell.photo = photos[indexPath.row]
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let imageDetailVC = ImageDetailVC()
		imageDetailVC.photo = photos[indexPath.row]
		navigationController?.pushViewController(imageDetailVC, animated: true)
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		if UIDevice.current.orientation.isLandscape {
			let width = (view.frame.width - 20) / 3
			let height = photos[indexPath.row].title?.height(constraintedWidth: width)
			return CGSize(width: width, height: width + height!)
		}else {
			let width = (view.frame.width - 10) / 2
			let height = photos[indexPath.row].title?.height(constraintedWidth: width)
			return CGSize(width: width, height: width + height!)
		}
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
			return
		}
		flowLayout.invalidateLayout()
	}
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return photos.count
	}
}
