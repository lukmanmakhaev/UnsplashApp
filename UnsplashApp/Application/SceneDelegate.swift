//
//  SceneDelegate.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = TabBarController()
        
        //UIImage(named: "phones")!.withRenderingMode(.alwaysTemplate)
        //UIImage(systemName: "square.grid.3x3.fill")
        let exploreVC = ExploreViewController()
        exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: "explore")!.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        
        let favouriteVC = FavouritesViewController()
        favouriteVC.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(named: "favourite")!.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        
        
        tabBarController.setViewControllers([exploreVC, favouriteVC], animated: false)
        
        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }



}
