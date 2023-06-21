//
//  MovieDetailsViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class MovieDetailsViewModel: NSObject {
    
    let movieID: String
    let shortDescription: String
    let genresString: String
    let releasedDate: String
    let trailerURLString: String
    let topDetailsCellViewModel: MovieDetailsCellViewModel
    
    internal init(movieID: String, shortDescription: String, genresString: String, releasedDate: String, trailerURLString: String, topDetailsCellViewModel: MovieDetailsCellViewModel) {
        self.movieID = movieID
        self.shortDescription = shortDescription
        self.genresString = genresString
        self.releasedDate = releasedDate
        self.trailerURLString = trailerURLString
        self.topDetailsCellViewModel = topDetailsCellViewModel
    }
    
    init(with movie: Movie) {
        topDetailsCellViewModel = MovieDetailsCellViewModel(title: movie.title, imageName: movie.imageName, rating: movie.ratings, onWatchList: movie.onWatchList)
        trailerURLString = movie.trailerURLString
        shortDescription = movie.details
        genresString = movie.genres.joined(separator: ", ")
        releasedDate = movie.releasedDate.string(with: "yyyy, d MMMM")
        movieID = movie.movieID
    }
}
