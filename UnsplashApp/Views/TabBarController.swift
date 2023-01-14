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
		
		let exploreDetailVC = ExploreDetailsVC()
		
		let exploreVC = ExploreViewController(collectionViewLayout: UICollectionViewFlowLayout())
		exploreVC.expDetailsVC = exploreDetailVC
		
		
		let favouriteVC = FavouritesViewController()
		favouriteVC.expDVC = exploreDetailVC
		
		
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

