//
//  PictureManager.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 15.01.2023.
//

import UIKit

protocol PictureManagerDelegate {

    func getArray(getArray: [PictureModel.PictureItem])
    func didFailWithError(_ error: Error)
}

class PictureManager {
    
    // MARK: - Properties
    var networkService = NetworkService()
    
    let exploreDVC = ExploreDetailsVC()
    let favouritesDVC = FavouritesDetailsVC()
    
    var delegate: PictureManagerDelegate?
    
    var picturesArray: [PictureModel.PictureItem] = []
    var favouritesArray: [PictureModel.PictureItem] = []

    
    // MARK: - Functions
    
    func delegateNetworkManager() {
        networkService.delegate = self
        networkService.fetchPhotos()
    }
    
    func fetchPhotos(keyWord: String) {
        networkService.fetchPhotos(keyWord: keyWord)
    }
    
    func getPicturesArray() -> [PictureModel.PictureItem] {
        return picturesArray
    }
    
    func getFavouritesArray() -> [PictureModel.PictureItem] {
        return favouritesArray
    }
    
}

// MARK: - NetworkServiceDelefate
extension PictureManager: NetworkServiceDelegate {
    
    func didUpdatePicture(picture: PictureModel) {
        self.picturesArray = picture.picsArray
        self.delegate?.getArray(getArray: picturesArray)
        
        //print(self.picturesArray.count)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
