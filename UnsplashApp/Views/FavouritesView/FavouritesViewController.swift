//
//  FavouritesViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

class FavouritesViewController: UIViewController, FavourDelegate {
    
    // MARK: - Properties
	var expDVC: ExploreDetailsVC?
    var favsDVC: FavouritesDetailsVC?
    //let favsDetailsVC = FavouritesDetailsVC()
    
    var pictureManager = PictureManager()
    var favsArray: [PictureModel.PictureItem]?
    
	// MARK: - UI
    var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = UIColor .clear
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        return t
        
    }()
  
	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resources.Colors.background
        title = "Favourites"
    
        expDVC?.delegateFavour = self
		
			 
        tableView.reloadData()
        initView()
    }
    
    @objc func refreshList(_ sender: Any) {
        tableView.reloadData()
    }
		
	func addItem(item: PictureModel.PictureItem) {
		favsArray!.append(item)
		//tableView.reloadData()

	}
    
    func reloadTableView() {
        tableView.reloadData()
    }

    func initView() {
        self.view.addSubview(tableView)
        //set delegates
        tableView.delegate = self
        tableView.dataSource = self
        //set row height
        tableView.rowHeight = 120
        //register cells
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: "FavouriteCell")
        //set constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - TableView Delegate&DataSource
extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictureManager.favouritesArray.count
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteCell
    
        let url = pictureManager.favouritesArray[indexPath.row].small
        
        cell.picture.kf.setImage(with: URL(string: url))
        
        cell.authorLabel.text = pictureManager.favouritesArray[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as? FavouriteCell
        
        guard let detailController = expDVC else { return }
        detailController.updateData(item: pictureManager.favouritesArray[indexPath.row])
        detailController.calledFrom = 1

        expDVC!.indexNum = Int(indexPath.row)
        
        present(expDVC!, animated: true)
    }
}
