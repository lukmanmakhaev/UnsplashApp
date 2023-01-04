//
//  ExploreViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit




class ExploreViewController: UIViewController {
    
    var detailsVC = DetailsViewController()
    var picturesVC = PicturesCollectionView()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.white
        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    

    /*var randomLabel: UILabel = {
        let label = UILabel()
        label.text = "Random pictures"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()*/
     
    
    var picture: UIImageView = {
        let pic = UIImageView()
        //pic.contentMode = .scaleAspectFill
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
     
    private var picsCollectionView = PicturesCollectionView()
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Random pictures"
        //picsCollectionView.delegate = self
        picsCollectionView.delegate2 = self
        //self.navigationController?.pushViewController(detailsVC, animated: true)
        initview()
    }
    
    func initview() {
        view.addSubview(searchBar)
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        /*self.view.addSubview(randomLabel)
        randomLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 7).isActive = true
        randomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        randomLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        randomLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true*/
        
        self.view.addSubview(picsCollectionView)
        picsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        picsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        picsCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        picsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        picsCollectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }

    
}

extension ExploreViewController: PicturesCollectionViewDelegate {
    func tapped(string: String, picture: String, location: String) {

        
        detailsVC.updateData(title: string, picture: picture, location: location)
        self.navigationController?.pushViewController(detailsVC, animated: true)

    }
    

}
