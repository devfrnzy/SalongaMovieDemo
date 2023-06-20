//
//  Movie.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class Movie: NSObject {

    let movieID: String
    let title: String
    let details: String
    let ratings: Float
    let duration: String
    let genres: [String]
    let releasedDate: Date
    let trailerURLString: String
    let onWatchList: Bool
    let imageName: String
    
    init(movieID: String, title: String, details: String, ratings: Float, duration: String, genres: [String], releasedDate: Date, trailerURLString: String, onWatchList: Bool, imageName: String) {
        self.movieID = movieID
        self.title = title
        self.details = details
        self.ratings = ratings
        self.duration = duration
        self.genres = genres
        self.releasedDate = releasedDate
        self.trailerURLString = trailerURLString
        self.onWatchList = onWatchList
        self.imageName = imageName
    }
    
    init(with dictionary:Dictionary<AnyHashable, Any>) {
        movieID = dictionary["id"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        details = dictionary["description"] as? String ?? ""
        ratings = dictionary["ratings"] as? Float ?? 0.0
        duration = dictionary["duration"] as? String ?? ""
        genres = dictionary["genres"] as? [String] ?? ["-"]
        trailerURLString = dictionary["trailerURL"] as? String ?? ""
        onWatchList = dictionary["onWatchList"] as? Bool ?? false
        imageName = dictionary["imageName"] as? String ?? ""
        
        let dateString = dictionary["releasedDate"] as? String ?? ""
        releasedDate = Date(from: dateString, with: "dd MMMM yyyy")
    }
    
}
