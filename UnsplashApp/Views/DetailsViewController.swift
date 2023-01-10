//
//  DetailsViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//


import Foundation
import UIKit

var picUrl = String()

var pic: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
}()

let locationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

let createdAtLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

let downloadsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

let favoriteButton: UIButton = {
    let button = UIButton()
    //button.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
    button.setTitle("Add to favourites", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.clipsToBounds = true
    button.backgroundColor = UIColor.init(hexString: "FFB200")
    button.layer.cornerRadius = 24
    //button.isUserInteractionEnabled = true
    return button
}()


private var favouritesVC = FavouritesViewController()
var pictureItem: PictureModel.PictureItem?
var picsList: [PictureModel.PictureItem] = []

class DetailsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //favouritesVC.delegate4 = self
    
        
        if pictureItem!.isFavourite == true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
        } else if pictureItem!.isFavourite == false {
            favoriteButton.setTitle("Add to favourites", for: .normal)
        }
        
        
        view.addSubview(pic)
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pic.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 400).isActive = true
        //pic.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.addSubview(locationLabel)
        locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: pic.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(createdAtLabel)
        createdAtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        createdAtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        createdAtLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(downloadsLabel)
        downloadsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        downloadsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        downloadsLabel.topAnchor.constraint(equalTo: createdAtLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(favoriteButton)
        favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        favoriteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        if pictureItem!.isFavourite == true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
        } else if pictureItem!.isFavourite == false {
            favoriteButton.setTitle("Add to favourites", for: .normal)
        }
        
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
        

        let navVC = tabBarController?.viewControllers?[1] as! UINavigationController
        let favouritesVC = navVC.topViewController as! FavouritesViewController
        
        //let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        //let favouritesVC = navVC.topViewController as! FavouritesViewController
        
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //managedObjectContext = appDelegate.managedObjectContext

        
        if pictureItem?.isFavourite != true {
            pictureItem?.isFavourite = true
            pictureItem?.indexNum = favouritesVC.favouritesList.count + 1
            //print("indexpath \(String(describing: pictureItem!.indexNum!)) ")
            
            favouritesVC.favouritesList.append(pictureItem!)
            print("favouritesVC items are \(String(describing: favouritesVC.favouritesList.count)) ")
        } else {
            pictureItem?.isFavourite = false
            favouritesVC.favouritesList.remove(at: (pictureItem?.indexNum)! - 1)
            //print("deleted from list \(String(describing: pictureItem!.indexNum!)) ")
            //print("favouritesVC items are \(String(describing: favouritesVC.favouritesList.count)) ")

        }
        
        if pictureItem!.isFavourite == true {
            favoriteButton.setTitle("Delete from favourites", for: .normal)
        } else if pictureItem!.isFavourite == false {
            favoriteButton.setTitle("Add to favourites", for: .normal)
        }
        
        print("favouritesVC items are \(String(describing: favouritesVC.favouritesList.count)) ")
        favouritesVC.tableView.reloadData()
        print("favouritesVC items are \(String(describing: favouritesVC.favouritesList.count)) ")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        
        //favoriteButton.tintColor = .gray
        self.dismiss(animated: true)
        
    }
    
}

/*extension DetailsViewController: FavouritesViewControllerDelegate {
    func favorCellChoosed(item: PictureModel.PictureItem) {
        
        updateData(item: item)
        favouritesVC.tableView.reloadData()
        print("pictureItem was updated")
    }
 
}*/
