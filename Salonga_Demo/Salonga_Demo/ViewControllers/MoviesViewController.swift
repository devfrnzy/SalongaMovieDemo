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
}

class MoviesViewController: UIViewController {
    
    weak var delegate: MoviesViewControllerDelegate?
    var moviesViewModel: MoviesViewModel
    
    
    init(moviesViewModel: MoviesViewModel) {
        self.moviesViewModel = moviesViewModel
        super.init(nibName: nil, bundle: nil)
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
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(SizeHelper.NavBarHeight + SizeHelper.statusBarHeight(from: view)) 
        }
    }
    
    func setupNavigationBar() {
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
//        view.addSubview(navBar)
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(didTapSort:))
//        navItem.rightBarButtonItem = doneItem
//
//        navBar.setItems([navItem], animated: false)
    }
    
    @objc func didTapSort() {
        
    }
}
