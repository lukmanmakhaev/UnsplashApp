//
//  PicturesCollectionView.swift
//  UnsplashApp
//
//  Created by Lukman Makhaev on 04.01.2023.
//

import UIKit
import Kingfisher

protocol PicturesCollectionViewDelegate {
    func tapped(string: String, picture: String, location: String, date: String, likes: Int)
}


class PicturesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var picsList: [PictureModel.PictureItem] = []
    var picturesManager = PicturesManager()
    var detailsVC = DetailsViewController()
    
    var delegate2: PicturesCollectionViewDelegate?
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        
        picturesManager.delegate = self
        picturesManager.fetchPhotos()
        
        reloadData()

        delegate = self
        dataSource = self
        register(PicCell.self, forCellWithReuseIdentifier: PicCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: PicCell.reuseId, for: indexPath) as! PicCell
 
        let url = picsList[indexPath.row].small
        
        cell.picture.kf.setImage(with: URL(string: url))
        
        //cell.picUrl = picsList[indexPath.row].small
        
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width - 30 - 10) / 4, height: (self.frame.size.width - 30 - 10) / 4)
    }
    
    
    
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, minimumInterItemSpacingForSectionAt section : Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath) as? PicCell
        
        let url = picsList[indexPath.row].raw
        let pic = UIImageView()
        pic.kf.setImage(with: URL(string: url))
        
        //print(picsList[indexPath.row].safeLocation)

        
   
        //delegate2?.tapped(string: picsList[indexPath.row].name, picture: pic)
        delegate2?.tapped(string: picsList[indexPath.row].name,
                          picture: picsList[indexPath.row].raw,
                          location: picsList[indexPath.row].safeLocation,
                          date: picsList[indexPath.row].createdAt,
                          likes: picsList[indexPath.row].likes
        )
    }
    
}

extension PicturesCollectionView: PicturesManagerDelegate {
    
    func didUpdatePicture(picture: PictureModel) {
        DispatchQueue.main.async {
            self.picsList = picture.picsArray
            self.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
