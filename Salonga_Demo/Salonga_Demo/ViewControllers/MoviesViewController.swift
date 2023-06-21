//
//  MoviesViewController.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit
import SnapKit

protocol MoviesViewControllerDelegate: NSObject {
    func moviesViewController(_ moviesViewController: MoviesViewController, didSelectMovieWith movieID: String)
    func refreshViewModelsForMoviesViewController(_ moviesViewController: MoviesViewController)
}

class MoviesViewController: UIViewController {
    
    weak var delegate: MoviesViewControllerDelegate?
    var moviesViewModel: MoviesViewModel
    var sortType: MoviesViewModel.SortType = .name
    
    
    init(moviesViewModel: MoviesViewModel) {
        self.moviesViewModel = moviesViewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Movies"
    }
    
    required init?(coder: NSCoder) {
        fatalError("initWithCoder Not implemented")
    }
    
    lazy var tableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: String.init(describing: MovieTableViewCell.self))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 40))
        label.text = moviesViewModel.headerTitle
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        view.addSubview(label)
        tableView.tableHeaderView = view
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.refreshViewModelsForMoviesViewController(self)
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(SizeHelper.NavBarHeight + SizeHelper.statusBarHeight(from: view))
        }
    }
    
    func setupNavigationBar() {

        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(didTapSort(_:)))
        sortButton.tintColor = .black
        self.navigationItem.rightBarButtonItems = [sortButton]
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.clear]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func update(with viewModel: MoviesViewModel) {
        moviesViewModel = viewModel
        moviesViewModel.sort(by: sortType)
        tableView.reloadData()
    }
    
    @objc func didTapSort(_ sender: UIBarButtonItem) {
        let byTitleAction = UIAlertAction(title: "Title",
                                          style: .default) { (action) in
            self.moviesViewModel.sort(by: .name)
            self.sortType = .name
            self.tableView.reloadData()
        }
        let byDateAction = UIAlertAction(title: "Released Date",
                                         style: .default) { (action) in
            self.moviesViewModel.sort(by: .releasedDate)
            self.sortType = .releasedDate
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        alert.addAction(byTitleAction)
        alert.addAction(byDateAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
