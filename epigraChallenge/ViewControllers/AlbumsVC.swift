//
//  ViewController.swift
//  epigraChallenge
//
//  Created by Alper Tabak on 20.12.2017.
//  Copyright © 2017 alpertabak. All rights reserved.
//

import UIKit

class AlbumsVC: UITableViewController {

	var albums = [Albums]()
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		navigationItem.title = "Albums"
		tableView.backgroundColor = .black
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
		
		Api.shared.getAlbums { (albumsFromApi) in
			guard let albums = albumsFromApi else { return }
			
			self.albums.append(albums)
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	

}

extension AlbumsVC {
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
		cell.textLabel?.text = albums[indexPath.row].title
		cell.textLabel?.textColor = .green
		cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
		cell.backgroundColor = .black
		
		return cell
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let layout = UICollectionViewFlowLayout()
		let detailsVC = AlbumDetailsVC(collectionViewLayout: layout)
		detailsVC.albumId = albums[indexPath.row].id
		
		navigationController?.pushViewController(detailsVC, animated: true)
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return albums.count
	}
}

