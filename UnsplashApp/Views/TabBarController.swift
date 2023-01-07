//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var favouritesList: [PictureModel.PictureItem] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
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
    

}

