//
//  MovieDetailsViewController+CellDelegate.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import Foundation
import WebKit

extension MovieDetailsViewController: DetailsTableViewCellDelegate {
    func didTapAddToWatchList(in detailsTableViewCell: DetailsTableViewCell) {
        delegate?.movieDetailsViewController(self, didToggleWatchListFor: viewModel.movieID)
    }
    
    func didTapWatchTrailer(in detailsTableViewCell: DetailsTableViewCell) {
        let webVC =  WebViewController(trailerURLString: viewModel.topDetailsCellViewModel.trailerURLString)
        present(webVC, animated: true)
    }

}

extension MovieDetailsViewController: WKNavigationDelegate {
    
}
