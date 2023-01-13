//
//  ExploreDetailsVC.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 10.01.2023.
//


import UIKit


class ExploreDetailsVC: DetailsViewController {
    
    //let favsVC = FavouritesViewController()
    let detailsVC = DetailsViewController()
    
    override func viewDidLoad() {
        
        initConstraints()
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

        //let navVC = tabBarController?.viewControllers? [1] as! UINavigationController
        //let favsVC = navVC.topViewController as! FavouritesViewController
        
        if pictureItem?.isFavourite != true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
            pictureItem?.isFavourite = true
            pictureItem?.indexNum = favsList.count + 1
            
            favsList.append(pictureItem!)
            //print("indexpath \(String(describing: pictureItem!.indexNum!)) ")
        } else {
            favoriteButton.setTitle("Add to favourites", for: .normal)
            pictureItem?.isFavourite = false
            favsList.remove(at: (pictureItem?.indexNum)! - 1)
            //print("deleted from list \(String(describing: pictureItem!.indexNum!)) ")
            //print("favouritesVC items are \(String(describing: favouritesVC.favouritesList.count)) ")
        }

        
        print(favsList.count)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        
        //favoriteButton.tintColor = .gray
        self.dismiss(animated: true)
        
    }
    
}
