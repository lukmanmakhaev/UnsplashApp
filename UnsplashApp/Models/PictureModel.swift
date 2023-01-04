//
//  PhotoModel.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//

import UIKit

struct PictureModel {
    let picsArray: [PictureItem]
    
    
    struct PictureItem {
        
        //description
        let id: String
        let createdAt: String
        
        //picture
        let raw: String
        let small: String
        
        //likes
        let likes: Int
        
        //user
        let name: String
        let profile_image: String
        
    }
    
}



