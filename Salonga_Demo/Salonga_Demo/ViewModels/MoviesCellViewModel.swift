//
//  MoviesCellViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class MoviesCellViewModel: NSObject {
    
    let movieID: String
    let title: String
    let subtitle: String
    let imageName: String
    let onWatchList: Bool
    let releasedDate: Date
    
    
    init(movieID: String, title: String, subtitle: String, imageName: String, onWatchList: Bool, releasedDate: Date) {
        self.movieID = movieID
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.onWatchList = onWatchList
        self.releasedDate = releasedDate
    }
    
    init(with movie:Movie) {
        movieID = movie.movieID
        title = "\(movie.title) (\(movie.releasedDate.yearString))"
        subtitle = "\(movie.duration) - \(movie.genres.joined(separator: ", "))"
        onWatchList = movie.onWatchList
        imageName = movie.imageName
        releasedDate = movie.releasedDate
    }
}
