//
//  MovieDetailsViewController.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

protocol MovieDetailsViewControllerDelegate: NSObject {
    
    func movieDetailsViewController(_ movieDetailsViewController: MovieDetailsViewController, didToggleWatchListFor movieID: String)
    
}

class MovieDetailsViewController: UIViewController {
    
    weak var delegate: MovieDetailsViewControllerDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.register(TopDetailsTableViewCell.self, forCellReuseIdentifier: String(describing: TopDetailsTableViewCell.self))
        tableView.register(MovieDescriptionTableViewCell.self, forCellReuseIdentifier: String(describing: MovieDescriptionTableViewCell.self))
        tableView.register(BottomDetailsTableViewCell.self, forCellReuseIdentifier: String(describing: BottomDetailsTableViewCell.self))
        return tableView
    }()
    
    var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("MovieDetailsViewController: Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(SizeHelper.NavBarHeight + SizeHelper.statusBarHeight(from: view))
        }
    }
    
    func update(with viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}
