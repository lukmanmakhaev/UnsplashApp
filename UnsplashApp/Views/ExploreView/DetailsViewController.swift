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

let likesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

class DetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(pic)
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pic.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 400).isActive = true
        //pic.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.addSubview(locationLabel)
        locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: pic.bottomAnchor).isActive = true
        
        view.addSubview(createdAtLabel)
        createdAtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        createdAtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        createdAtLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor).isActive = true
        
        view.addSubview(likesLabel)
        likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        likesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        likesLabel.topAnchor.constraint(equalTo: createdAtLabel.bottomAnchor).isActive = true

    }
    
    func updateData(title: String, picture: String, location: String, date: String, likes: String) {
        likesLabel.text = "Likes: \(likes)"
        locationLabel.text = "Location: \(location)"
        createdAtLabel.text = "Created in: \(date)"
        picUrl = picture
        self.title = title
        pic.kf.setImage(with: URL(string: picUrl))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    
    }
    
  
}
