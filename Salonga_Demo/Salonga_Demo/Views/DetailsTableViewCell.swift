//
//  DetailsTableViewCell.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

protocol DetailsTableViewCellDelegate: NSObject {
    func didTapAddToWatchList(in detailsTableViewCell: DetailsTableViewCell)
    func didTapWatchTrailer(in detailsTableViewCell: DetailsTableViewCell)
}

class DetailsTableViewCell: UITableViewCell {

    weak var delegate: DetailsTableViewCellDelegate?
    
    lazy var watchTrailerButton: UIButton = {
        let button = UIButton()
        button.setTitle("WATCH TRAILER", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        button.addTarget(self, action: #selector(didTapWatchTrailerButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addToWatchListButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ ADD TO WATCHLIST", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .init(red: 240/255, green: 238/255, blue: 235/255, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.addTarget(self, action: #selector(didTapAddToWatchListButton(_:)), for: .touchUpInside)

        return button
    }()
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(watchTrailerButton)
        contentView.addSubview(addToWatchListButton)
        contentView.addSubview(ratingLabel)
        
        posterImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.leading.equalTo(20)
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalTo(200)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.trailing.equalTo(-5)
        }
        
        ratingLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView).offset(10)
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.trailing.equalTo(ratingLabel.snp.leading).offset(-15)
        }
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        watchTrailerButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.height.equalTo(30)
            make.bottom.lessThanOrEqualTo(posterImageView).offset(-5)
        }
        watchTrailerButton.layer.cornerRadius = 15
        
        addToWatchListButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.height.equalTo(30)
            make.bottom.equalTo(watchTrailerButton.snp.top).offset(-20)
            make.trailing.lessThanOrEqualTo(-5)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        addToWatchListButton.layer.cornerRadius = 15
    }
    
    func update(with viewModel: MovieDetailsCellViewModel) {
        titleLabel.text = viewModel.title
        ratingLabel.attributedText = viewModel.attributedRating
        posterImageView.image = .init(named: viewModel.imageName)
        toggleWatchListButton(toggle: viewModel.onWatchList)
        
    }
    
    func toggleWatchListButton(toggle: Bool) {
        let buttonText = toggle ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCH LIST"
        addToWatchListButton.setTitle(buttonText, for: .normal)
        addToWatchListButton.sizeToFit()
    }
    
    @objc func didTapWatchTrailerButton(_ button: UIButton) {
        delegate?.didTapWatchTrailer(in: self)
    }
    
    @objc func didTapAddToWatchListButton(_ button: UIButton) {
        delegate?.didTapAddToWatchList(in: self)
    }

}
