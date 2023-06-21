//
//  MovieTableViewCell.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: SizeHelper.scale(18), weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: SizeHelper.scale(14), weight: .light)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let onWatchListLabel: UILabel = {
        let label = UILabel()
        label.text = "ON MY WATCHLIST"
        label.font = .systemFont(ofSize: SizeHelper.scale(12), weight: .heavy)
        label.textColor = .darkGray
        label.isHidden = true
        return label
    }()
    
    let posterImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let labelContainer = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MovieTableViewCell: Not implemented")
    }
    
    func setupViews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(onWatchListLabel)
        contentView.addSubview(labelContainer)
        labelContainer.addSubview(titleLabel)
        labelContainer.addSubview(subtitleLabel)
        
        posterImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.leading.equalTo(SizeHelper.scale(20))
            make.top.equalTo(SizeHelper.scale(20))
            make.bottom.equalTo(SizeHelper.scale(-20))
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(posterImageView.snp.trailing).offset(SizeHelper.scale(10))
            make.trailing.equalTo(SizeHelper.scale(-10))
            make.top.greaterThanOrEqualTo(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(SizeHelper.scale(5))
        }
        
        onWatchListLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(labelContainer.snp.bottom).offset(SizeHelper.scale(5)).priority(900)
            make.bottom.equalTo(posterImageView.snp.bottom).offset(SizeHelper.scale(-10))
            make.leading.equalTo(labelContainer)
            make.trailing.equalTo(SizeHelper.scale(15))
            make.height.equalTo(SizeHelper.scale(10))
        }
    }
    
    func update(with viewModel: MoviesCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        posterImageView.image = .init(named: viewModel.imageName)
        onWatchListLabel.isHidden = !viewModel.onWatchList
    }
    
}
