//
//  FavouriteCell.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 05.01.2023.
//

import UIKit



class FavouriteCell: UITableViewCell {
    
    static let reuseId = "FavouriteCell"
    
    var picture: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .gray
        return image
    }()
    
    
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        picture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 100).isActive = true

        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 24).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
