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
    
    lazy var attributedRating: NSAttributedString = {
        let ratingStr = "\(rating)" as NSString
        let fullRatingStr = "\(ratingStr)/10"
        let attString = NSMutableAttributedString(string: fullRatingStr)
        let range = NSMakeRange(0, ratingStr.length)
        
        attString.addAttribute(.font, value: UIFont.systemFont(ofSize: SizeHelper.scale(20), weight: .bold), range: range)
        attString.addAttribute(.foregroundColor, value: UIColor.black, range:  range)
        return attString
    }()
    
    init(title: String, imageName: String, rating: Float, onWatchList: Bool) {
        self.title = title
        self.imageName = imageName
        self.rating = rating
        self.onWatchList = onWatchList
    }
}
