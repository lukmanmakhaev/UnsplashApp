//
//  DetailsViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//


import UIKit


class DetailsViewController: UIViewController {
    
    var favsList = [PictureModel.PictureItem]()
    
    //var pictureItem: PictureModel.PictureItem?

    var indexPath = Int()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    
    func initConstraints() {

        view.backgroundColor = Resources.Colors.background
        
        view.addSubview(pic)
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pic.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
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
    }
 
}
