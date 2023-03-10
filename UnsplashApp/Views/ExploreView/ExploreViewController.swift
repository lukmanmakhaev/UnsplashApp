//
//  EditController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 09.01.2023.
//

import UIKit

class ExploreViewController: UICollectionViewController {
        
	var keyWord = String()
    var picsList: [PictureModel.PictureItem] = []
    
    //test
    var picsManager: PictureManager?
	var networkService = NetworkService()
	var expDetailsVC: ExploreDetailsVC?
    
    
    // MARK: - UI
	let refreshControl = UIRefreshControl()
	
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
    
	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.background
        
        picsManager!.delegate = self
        refreshControl.addTarget(self, action: #selector(refreshPhotos(_:)), for: .valueChanged)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()
        collectionView.addSubview(refreshControl)
        
        collectionView.reloadData()
        
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    @objc func refreshPhotos(_ sender: Any) {
        // Fetch Weather Data
        //networkService.fetchPhotos()
        picsManager!.fetchPhotos()
        collectionView.reloadData()
        
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseId)
        
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.allowsMultipleSelection = true
        
        
        //collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseId)
    }
    
    
    // MARK: - UICollecionViewDataSource, UICollecionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseId, for: indexPath) as! Cell
 
        let url = picsList[indexPath.row].small
        
        cell.picture.kf.setImage(with: URL(string: url))
        
        cell.backgroundColor = .gray
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath) as? PicCell
 
		guard let detailController = expDetailsVC else { return }
        detailController.picsManager = self.picsManager
		detailController.updateData(item: picsList[indexPath.row])
        detailController.indexNum = Int(indexPath.row)
        detailController.calledFrom = 0
        //print(detailController.indexNum)
		//detailController.indexPath = indexPath.row
		present(detailController, animated: true)
        
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (view.frame.size.width - 30 - 10) / 3, height: (view.frame.size.width - 30 - 10) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInserts = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return sectionInserts
    }
    
    func collectionView(_ collectionview: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


//MARK: - SearchBar
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
        picsManager!.fetchPhotos(keyWord: self.keyWord)
        
    }
}

extension ExploreViewController: PictureManagerDelegate {
    func getArray(getArray: [PictureModel.PictureItem]) {
        DispatchQueue.main.async {
            self.picsList = getArray
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
