//
//  Pics.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//
import UIKit

struct Picture: Codable {
    
    
    let id: String
    let created_at: String
    let urls: Urls
    let likes: Int
    let user: User
    
    
}

struct Urls: Codable {
    let raw: String
    let small: String
  
}

struct User: Codable {
    let name: String
    let profile_image: ProfileImage
    
    
    
}

struct ProfileImage: Codable {
    let large: String
}

