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

        
        self.window = window
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
    }



}

