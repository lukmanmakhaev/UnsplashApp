//
//  ExploreViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit




class ExploreViewController: UIViewController {
    
    var detailsVC = DetailsViewController()
    var picsManager = PicturesManager()
    var keyWord = String()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.white
        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    var picture: UIImageView = {
        let pic = UIImageView()
        //pic.contentMode = .scaleAspectFill
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
     
    private var picsCollectionView = PicturesCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.background
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        picsCollectionView.delegate2 = self
        initview()
    }
    
    func initview() {
        self.view.addSubview(picsCollectionView)
        picsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        picsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        picsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        picsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        picsCollectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    
}

extension ExploreViewController: PicturesCollectionViewDelegate {
    func tapped(item: PictureModel.PictureItem) {
        
        detailsVC.updateData(item: item)
        self.navigationController?.pushViewController(detailsVC, animated: true)

    }
}

extension ExploreViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
        self.keyWord = textSearched
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
        
        }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        picsCollectionView.searchByWord(keyword: keyWord)
    }
}
