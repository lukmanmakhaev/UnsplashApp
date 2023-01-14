//
//  FavouritesViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit


class FavouritesViewController: UIViewController, FavourDelegate {
    
    func passItem(item: PictureModel.PictureItem) {
        favsArray.append(item)
        tableView.reloadData()
        print(favsArray.count)
    }
    
    
    var favsArray: [PictureModel.PictureItem] = []
    
    var expDVC = ExploreDetailsVC()
    let favsDetailsVC = FavouritesDetailsVC()
    
    var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = UIColor .clear
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        return t
        
    }()
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.background
        title = "Favourites"
        
        //let detailsVC = DetailsViewController()
    
        expDVC.delegateFavour = self
        
        
        tableView.reloadData()
        initView()
    
    }
    
    @objc func refreshList(_ sender: Any) {
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

//item: PictureModel.PictureItem

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteCell
    
        //let url = favouritesList[indexPath.row].small
        
        //cell.picture.kf.setImage(with: URL(string: url))
        
        //cell.authorLabel.text = favouritesList[indexPath.row].name
        
        return cell
    }

    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as? FavouriteCell
        //self.present(detailsVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(expDetailsVC, animated: true)
        
        
        //expDetailsVC.updateData(item: favouritesList[indexPath.row])
        
       
        present(favsDetailsVC, animated: true)
        print(favsArray.count)
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.cellForRow(at: indexPath) as? FavouriteCell
    }
    
}


