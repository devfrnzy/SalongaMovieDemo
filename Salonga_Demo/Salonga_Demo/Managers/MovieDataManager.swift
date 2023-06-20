//
//  MovieDataManager.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class MovieDataManager: NSObject {
    
    private(set) var movies = Array<Movie>()
    
    func processPlistData() {
        guard let url = Bundle.main.url(forResource: "Movies", withExtension: "plist"),
              let movieData = try? Data(contentsOf: url),
              let moviesPlist = try? PropertyListSerialization.propertyList(from: movieData, options: [], format: nil) as? Array<Dictionary<AnyHashable, Any>>
        else {
            print("MovieDataManager: Invalid URL")
            return
        }
        
        
        var movies = Array<Movie>()
        for movieDict in moviesPlist {
            let movie = Movie(with: movieDict)
            movies.append(movie)
        }
        
        self.movies = movies
    }
    
    func movie(with movieID: String) -> Movie? {
        return movies.filter{ $0.movieID == movieID }.first
    }
    
    
}
