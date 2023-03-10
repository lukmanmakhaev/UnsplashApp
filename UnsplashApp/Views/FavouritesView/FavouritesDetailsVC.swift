//
//  FavouritesDetailsVC.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 10.01.2023.
//

import UIKit

class FavouritesDetailsVC: BaseDetailsViewController {
    
	// MARK: - Properties
	var pictureItem: PictureModel.PictureItem?
    var favourites: [PictureModel.PictureItem] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
		super.viewDidLoad()

        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
    }
    
    func updateData(item: PictureModel.PictureItem) {
        
        pictureItem = item
    
        if pictureItem!.isFavourite == true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
        } else if pictureItem!.isFavourite == false {
            favoriteButton.setTitle("Add to favourites", for: .normal)
        }
        
        
        downloadsLabel.text = "Downloads: \(item.downloads)"
        locationLabel.text = "Location: \(item.safeLocation)"
        createdAtLabel.text = "Created in: \(item.createdAt)"
        picUrl = item.regular
        pic.kf.setImage(with: URL(string: picUrl))
        
        self.title = item.name
    }
    
    @objc func favoriteButtonPressed(sender: UIButton!) {
        
        if pictureItem?.isFavourite != true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
            pictureItem?.isFavourite = true
            //pictureItem?.indexNum = favsList.count + 1
            //pictureItem?.indexNum = favouritesVC.favouritesList.count + 1
        } else {
            favoriteButton.setTitle("Add to favourites", for: .normal)
            pictureItem?.isFavourite = false
            //favouritesVC.favouritesList.remove(at: (pictureItem?.indexNum)! - 1)
            //favsList.remove(at: (pictureItem?.indexNum)! - 1)
        }
    }
}
