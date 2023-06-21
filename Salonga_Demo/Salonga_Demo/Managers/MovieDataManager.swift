//
//  MovieDataManager.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class MovieDataManager: NSObject {
    
    private(set) var movies = Array<Movie>()
    
    func processData() {
        
    
    }
    
    func saveData() {
        do {
            let plistData = try PropertyListSerialization.data(fromPropertyList: arrayOfMovieDictionaries(), format: .binary, options: 0)
            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("movies_saved.plist")
            try plistData.write(to: fileURL)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func arrayOfMovieDictionaries() -> Array<Dictionary<AnyHashable, Any>> {
        var array = [Dictionary<AnyHashable, Any>]()
        for movie in movies {
            array.append(movie.dictionaryValue())
        }
        return array
    }
    
    func processPlistData() {
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("movies_saved.plist")
        do {
            let plistData = try Data(contentsOf: fileURL)
            guard let array = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? Array<Dictionary<AnyHashable, Any>> else {
                print("Error: Invalid plist format")
                return
            }
            
            processArrayOfDictionaries(array)
        } catch {
            processInitialData()
        }
    }
    
    func processInitialData() {
        guard let url = Bundle.main.url(forResource: "Movies", withExtension: "plist"),
              let movieData = try? Data(contentsOf: url),
              let moviesPlist = try? PropertyListSerialization.propertyList(from: movieData, options: [], format: nil) as? Array<Dictionary<AnyHashable, Any>>
        else {
            print("MovieDataManager: Invalid URL")
            return
        }
        processArrayOfDictionaries(moviesPlist)
    }
    
    func processArrayOfDictionaries(_ array: Array<Dictionary<AnyHashable, Any>>) {
        var movies = [Movie]()
        for movieDict in array {
            let movie = Movie(with: movieDict)
            movies.append(movie)
        }
        
        self.movies = movies
    }
    
    func movie(with movieID: String) -> Movie? {
        return movies.filter{ $0.movieID == movieID }.first
    }
    
    func toggleWatchlist(for movieID: String) {
        if let movie = movie(with: movieID) {
            movie.onWatchList = !movie.onWatchList
            saveData()
        }
    }
    
    
}
