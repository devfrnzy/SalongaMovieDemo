//
//  MoviesCellViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class MoviesCellViewModel: NSObject {
    
    let title: String
    let subtitle: String
    let imageName: String
    let onWatchList: Bool
    
    
    init(title: String, subtitle: String, imageName: String, onWatchList: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.onWatchList = onWatchList
    }
    
    init(with movie:Movie) {
        title = "\(movie.title) (\(movie.releasedDate.yearString))"
        subtitle = "\(movie.duration) - \(movie.genres.joined(separator: ", "))"
        onWatchList = movie.onWatchList
        imageName = movie.imageName
    }
}
