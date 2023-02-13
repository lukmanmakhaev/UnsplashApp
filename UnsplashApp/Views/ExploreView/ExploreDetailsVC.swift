//
//  ExploreDetailsVC.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 10.01.2023.
//


import UIKit

protocol FavourDelegate {
    func addItem(item: PictureModel.PictureItem)
    
    func reloadTableView()
}

class ExploreDetailsVC: BaseDetailsViewController {
    
	// MARK: - Properties
    var delegateFavour: FavourDelegate?
    var pictureItem: PictureModel.PictureItem?
    var picsManager: PictureManager?
    var indexNum = 0
    var calledFrom: Int?
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
		super.viewDidLoad()
        
        // works only for first load
        print(indexNum)
		
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
            picsManager?.favouritesArray.append(pictureItem!)
            self.delegateFavour?.addItem(item: pictureItem!)
            
        } else {
            favoriteButton.setTitle("Add to favourites", for: .normal)
            
            if calledFrom == 0 {
                picsManager?.favouritesArray.remove(at: (picsManager?.favouritesArray.count)! - 1)
            } else {
                picsManager?.favouritesArray.remove(at: indexNum)
            }
            
            pictureItem?.isFavourite = false
        }
        delegateFavour?.reloadTableView()
    }
}
