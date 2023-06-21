//
//  MovieDetailsViewController+Table.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:DetailsTableViewCell.self)) as? DetailsTableViewCell{
                cell.update(with: viewModel.topDetailsCellViewModel)
                return cell
            }
            break
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:MovieDescriptionTableViewCell.self)) as? MovieDescriptionTableViewCell {
                cell.update(shortDescription: viewModel.shortDescription)
                return cell
            }
            break
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:BottomDetailsTableViewCell.self)) as? BottomDetailsTableViewCell {
                cell.update(genre: viewModel.genresString, releasedDate: viewModel.releasedDate)
                return cell
            }
            break
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    
}

extension MovieDetailsViewController: UITableViewDelegate {
    
}
