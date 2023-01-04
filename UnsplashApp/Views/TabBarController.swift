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
            //let vc1 = UINavigationController(rootViewController: FirstViewController())
            //let vc2 = UINavigationController(rootViewController: SecondViewController())
            //let vc3 = UINavigationController(rootViewController: ThirdViewController())

            //viewControllers = [vc1, vc2, vc3]
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
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
    
    }

}

