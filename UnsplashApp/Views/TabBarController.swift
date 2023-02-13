//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
	
	// MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
        let pictureManager = PictureManager()
        
        //print(pictureManager.text)
        pictureManager.delegateNetworkManager()
        //var array1 = pictureManager.getPicturesArray()
        
		
		let exploreVC = ExploreViewController(collectionViewLayout: UICollectionViewFlowLayout())
        exploreVC.expDetailsVC = pictureManager.exploreDVC
        exploreVC.picsManager = pictureManager
        
        
		let favouriteVC = FavouritesViewController()
        favouriteVC.expDVC = pictureManager.exploreDVC
        favouriteVC.pictureManager = pictureManager
        favouriteVC.favsArray = pictureManager.favouritesArray
		
		
		viewControllers = [
			generateNavigationController(rootViewController: exploreVC, title: "Explore", image: UIImage(named: "explore")!.withRenderingMode(.alwaysTemplate)),
			generateNavigationController(rootViewController: favouriteVC, title: "Favourites", image: UIImage(named: "favourite")!.withRenderingMode(.alwaysTemplate)),
			
		]
		
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setTabBarAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setTabBarAppearance() {
		
		tabBar.tintColor = Resources.Colors.active
		tabBar.barTintColor = .white
		tabBar.backgroundColor = .white
		tabBar.layer.borderColor = Resources.Colors.separator.cgColor
		tabBar.layer.borderWidth = 1
		//tabBar.layer.masksToBounds = true
		
	}
	
	private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
		let navigationVC = UINavigationController(rootViewController: rootViewController)
		navigationVC.tabBarItem.title = title
		navigationVC.tabBarItem.image = image
		return navigationVC
	}
}

