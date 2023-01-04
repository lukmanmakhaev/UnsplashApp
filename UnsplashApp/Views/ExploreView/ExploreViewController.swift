//
//  ExploreViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit


class ExploreViewController: UIViewController {
    
    var picturesManager = PicturesManager()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.white
        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    var randomLabel: UILabel = {
        let label = UILabel()
        label.text = "Random pictures"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var picture: UIImageView = {
        let pic = UIImageView()
        pic.contentMode = .scaleAspectFill
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    var picsList: [PictureModel.PictureItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        picturesManager.delegate = self
        picturesManager.fetchPhotos()
        initview()
        
    }
    
    func initview() {
        view.addSubview(searchBar)
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        self.view.addSubview(randomLabel)
        randomLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 7).isActive = true
        randomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        randomLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        randomLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true
        
        self.view.addSubview(picture)
        picture.topAnchor.constraint(equalTo: randomLabel.bottomAnchor, constant: 7).isActive = true
        picture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }   
}


extension ExploreViewController: PicturesManagerDelegate {
    func didUpdatePicture(picture: PictureModel) {
        DispatchQueue.main.async {
            self.picsList = picture.picsArray
            

        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        picsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cellForItem(at: indexPath) as! ExploreViewPicCell
        
        
        
        return cell
    }
    
    
    
    
    
}
