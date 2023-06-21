//
//  BottomDetailsTableViewCell.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class BottomDetailsTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.text = "Details"
        return label
    }()
    
    let genreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "Genre"
        label.textAlignment = .right
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    let releasedDateTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .right
        label.text = "Released Date"
        return label
    }()
    
    let releasedDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreTitleLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(releasedDateTitleLabel)
        contentView.addSubview(releasedDateLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(10)
            make.top.equalTo(10)
        }
        
        genreTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.38)
            make.height.equalTo(genreLabel)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(genreTitleLabel)
            make.leading.equalTo(genreTitleLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
        }
        
        releasedDateTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(genreTitleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.38)
        }
        
        releasedDateLabel.snp.makeConstraints { make in
            make.top.equalTo(releasedDateTitleLabel)
            make.leading.equalTo(releasedDateTitleLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(-20)
        }
    }
    
    func update(genre: String, releasedDate: String) {
        genreLabel.text = genre
        releasedDateLabel.text = releasedDate
    }
}
