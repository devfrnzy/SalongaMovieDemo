//
//  MoviesViewController+Table.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

extension MoviesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.moviesCellModels.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self)) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = moviesViewModel.moviesCellModels[indexPath.row]
        cell.update(with: cellViewModel)
        
        return cell
    }
    
}

extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieCellViewModel = moviesViewModel.moviesCellModels[indexPath.row]
        delegate?.moviesViewController(self, didSelectMovieWith: movieCellViewModel.movieID)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
}
