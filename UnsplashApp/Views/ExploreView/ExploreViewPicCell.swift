//
//  ExploreViewPicCell.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//

import UIKit
class ExploreViewPicCell: UICollectionViewCell {
    
    
    static let reuseId = "ExploreViewPicCell"
    
    
    let picture: UIImageView = {
        let pic = UIImageView()
        pic.contentMode = .scaleAspectFill
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(picture)
        picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
        picture.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
