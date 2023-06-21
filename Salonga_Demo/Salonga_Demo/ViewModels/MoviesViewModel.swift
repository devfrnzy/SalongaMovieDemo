//
//  MoviesViewModel.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class MoviesViewModel: NSObject {
    
    enum SortType {
    case name, releasedDate
    }

    let headerTitle: String
    var moviesCellModels: [MoviesCellViewModel]
    
    init(headerTitle: String, moviesCellModels: [MoviesCellViewModel]) {
        self.headerTitle = headerTitle
        self.moviesCellModels = moviesCellModels
    }
    
    init(with movies: [Movie], headerTitle: String = "Movies") {
        self.headerTitle = headerTitle
        moviesCellModels = []
        for movie in movies {
            let movieCellViewModel = MoviesCellViewModel(with: movie)
            moviesCellModels.append(movieCellViewModel)
        }
        
        super.init()
        sort(by: .name)
    }
    
    func sort(by type: SortType) {
        switch type {
        case .name:
            moviesCellModels.sort { $0.title < $1.title }
            break
        case .releasedDate:
            moviesCellModels.sort { $0.releasedDate > $1.releasedDate }
        }
        
    }
}
