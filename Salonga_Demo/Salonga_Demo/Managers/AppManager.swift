//
//  AppManager.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class AppManager: NSObject {

    static let shared = AppManager()
    
    let movieDataManager = MovieDataManager()

    lazy var moviesViewController: MoviesViewController = {
        let moviesViewModel = MoviesViewModel(with: movieDataManager.movies)
        let vc = MoviesViewController(moviesViewModel: moviesViewModel)
        vc.delegate = self
        return vc
    }()
    
    lazy var navigationViewController = {
        return UINavigationController(rootViewController: moviesViewController)
    }()
    
    func startApp() {
        movieDataManager.processPlistData()
    }
    
}

extension AppManager: MoviesViewControllerDelegate {
    
    func moviesViewController(_ moviesViewController: MoviesViewController, didSelectMovieWith movieID: String) {
        guard let movie = movieDataManager.movie(with: movieID) else {
            print("AppManager: Invalid Movie ID - \(movieID)")
            return
        }
        
        let movieDetailsViewModel = MovieDetailsViewModel(with: movie)
        let vc = MovieDetailsViewController(viewModel: movieDetailsViewModel)
        navigationViewController.pushViewController(vc, animated: true)
    }
    
}
