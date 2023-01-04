//
//  UIImageView + ext.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//

import UIKit

extension UIImageView {
    func load(URL url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
