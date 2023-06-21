//
//  MovieDetailsViewController+CellDelegate.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import Foundation
import WebKit

extension MovieDetailsViewController: TopDetailsTableViewCellDelegate {
    func didTapAddToWatchList(in detailsTableViewCell: TopDetailsTableViewCell) {
        delegate?.movieDetailsViewController(self, didToggleWatchListFor: viewModel.movieID)
    }
    
    func didTapWatchTrailer(in detailsTableViewCell: TopDetailsTableViewCell) {
        let webVC =  WebViewController(trailerURLString: viewModel.trailerURLString)
        present(webVC, animated: true)
    }

}

extension MovieDetailsViewController: WKNavigationDelegate {
    
}
