//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

        let exploreVC = ExploreViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let favouriteVC = FavouritesViewController()


        //exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: "explore")!.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        
       // let favouriteVC = UINavigationController(rootViewController: FavouritesViewController())
        //favouriteVC.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(named: "favourite")!.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        
        
        //viewControllers = [exploreVC, favouriteVC]
        
        
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

