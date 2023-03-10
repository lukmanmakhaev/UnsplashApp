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
        let downloads: Int
        
        //picture
        let raw: String
        let regular: String
        let small: String
        
        //likes
        let likes: Int
        
        //user
        let name: String
        let profile_image: String
        let location: String?
        
        
        var safeLocation: String {
            if location != nil {
                let string = location
                return string!
            } else {
                let string = "-"
                return string
            }
        }
        
        var isFavourite = false
        
        var indexNum: Int?
        
        
    }
    
    
    
}



