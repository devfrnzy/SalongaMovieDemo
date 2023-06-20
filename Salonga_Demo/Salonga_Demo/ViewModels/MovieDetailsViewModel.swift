//
//  MovieDetailsViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class MovieDetailsViewModel: NSObject {

    let title: String
    let imageName: String
    let shortDescription: String
    let genresString: String
    let releasedDate: String
    let rating: NSAttributedString
    let onWatchList: Bool
    let trailerURLString: String
    
    init(title: String, imageName: String, shortDescription: String, genresString: String, releasedDate: String, rating: NSAttributedString, onWatchList: Bool, trailerURLString: String) {
        self.title = title
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.genresString = genresString
        self.releasedDate = releasedDate
        self.rating = rating
        self.onWatchList = onWatchList
        self.trailerURLString = trailerURLString
    }
    
    init(with movie: Movie) {
        title = movie.title
        imageName = movie.imageName
        shortDescription = movie.details
        genresString = movie.genres.joined(separator: ", ")
        releasedDate = movie.releasedDate.string(with: "yyyy, d MMMM")
        rating = NSAttributedString(string: "\(movie.ratings)")
        onWatchList = movie.onWatchList
        trailerURLString = movie.trailerURLString
        
    }
}
