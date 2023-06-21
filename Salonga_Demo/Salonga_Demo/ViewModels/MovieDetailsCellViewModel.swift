//
//  MovieDetailsCellViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class MovieDetailsCellViewModel: NSObject {
    
    let title: String
    let imageName: String
    let rating: Float
    let onWatchList: Bool
    let trailerURLString: String
    
    lazy var attributedRating: NSAttributedString = {
        let ratingStr = "\(rating)"
        let attString = NSMutableAttributedString(string: "\(ratingStr)/10")
        attString.addAttribute(.font, value: UIFont.systemFont(ofSize: 18), range: .init(location: 0, length: ratingStr.count))
        attString.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: ratingStr.count))
        return attString
    }()
    
    init(title: String, imageName: String, rating: Float, onWatchList: Bool, trailerURLString: String) {
        self.title = title
        self.imageName = imageName
        self.rating = rating
        self.onWatchList = onWatchList
        self.trailerURLString = trailerURLString
    }
}
