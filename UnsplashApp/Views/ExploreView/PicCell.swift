//
//  ExploreViewPicCell.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//

import UIKit
import Kingfisher


class PicCell: UICollectionViewCell {
    
    
    static let reuseId = "PicCell"
    
    var picUrl = String()
    
    
    var picture: UIImageView = {
        let pic = UIImageView()
        pic.contentMode = .scaleAspectFill
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.clipsToBounds = true
        return pic
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        picture.kf.setImage(with: URL(string: picUrl))
        
        
        contentView.addSubview(picture)
        picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
        picture.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picture.backgroundColor = .gray
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
