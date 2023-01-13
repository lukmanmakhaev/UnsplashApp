//
//  ExploreManager.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 03.01.2023.
//
import Foundation
import UIKit
import Kingfisher

protocol PicturesManagerDelegate {
    
    func didUpdatePicture(picture: PictureModel)
    func didFailWithError(_ error: Error)
    
}
struct PicturesManager {
    //https://api.unsplash.com/photos/random/?client_id=TiRhpw7YbVhu6Wx2v6_yAgaogsIZHTWsdU63ZufnPk4
    let urlString = "https://api.unsplash.com/photos/random/?client_id=TiRhpw7YbVhu6Wx2v6_yAgaogsIZHTWsdU63ZufnPk4&count=30"
    
    var delegate: PicturesManagerDelegate?
    
    func fetchPhotos() {
        performRequest(with: urlString)
    }
    
    func fetchPhotos(keyWord: String) {
        performRequest(with: "\(urlString)&query=\(keyWord)")
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if let pics = self.parseJSON(json: safeData) {
                        self.delegate?.didUpdatePicture(picture: pics)
                    }
                } else {
                    print("No data")
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(json: Data) -> PictureModel? {
        
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode([Picture].self, from: json)
            let list = decodedData
            
            var picsArray = [PictureModel.PictureItem]()
            
            for (index, _) in list.enumerated() {
                
                picsArray.append(PictureModel.PictureItem(id: list[index].id,
                                                          createdAt: list[index].created_at,
                                                          downloads: list[index].downloads,
                                                          raw: list[index].urls.raw,
                                                          regular: list[index].urls.regular,
                                                          small: list[index].urls.small,
                                                          likes: list[index].likes,
                                                          name: list[index].user.name,
                                                          profile_image: list[index].user.profile_image.large,
                                                          location: list[index].user.location
                                                          ))
            }
            
            //print(picsArray)
            
            let pics = PictureModel(picsArray: picsArray)
            return pics
   
        } catch {
            print(error)
            return nil
        }
        
    }
 
}
