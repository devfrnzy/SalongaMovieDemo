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
    var onWatchList: Bool
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
        ratings = Float(dictionary["rating"] as? String ?? "0.0") ?? 0.0
        duration = dictionary["duration"] as? String ?? ""
        genres = dictionary["genres"] as? [String] ?? ["-"]
        trailerURLString = dictionary["trailerLink"] as? String ?? ""
        onWatchList = dictionary["onWatchList"] as? Bool ?? false
        imageName = dictionary["imageName"] as? String ?? ""
        
        let dateString = dictionary["releasedDate"] as? String ?? ""
        releasedDate = Date(from: dateString, with: "dd MMMM yyyy")
    }
    
    func dictionaryValue() -> [AnyHashable: Any] {
        var dictionary = [AnyHashable: Any]()
        dictionary["id"] = movieID
        dictionary["title"] = title
        dictionary["description"] = details
        dictionary["rating"] = "\(ratings)"
        dictionary["duration"] = duration
        dictionary["genres"] = genres
        dictionary["trailerLink"] = trailerURLString
        dictionary["onWatchList"] = onWatchList
        dictionary["releasedDate"] = releasedDate.string(with: "dd MMMM yyyy")
        dictionary["imageName"] = imageName
        return dictionary
    }
    
}
