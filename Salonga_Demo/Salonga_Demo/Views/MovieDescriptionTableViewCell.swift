//
//  MovieDescriptionTableViewCell.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit

class MovieDescriptionTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: SizeHelper.scale(18), weight: .bold)
        label.textColor = .black
        label.text = "Short Description"
        return label
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: SizeHelper.scale(15))
        label.textColor = .gray
        label.numberOfLines = 0
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(shortDescriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(SizeHelper.scale(20))
            make.trailing.equalTo(SizeHelper.scale(10))
            make.top.equalTo(SizeHelper.scale(25))
        }
        
        shortDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(SizeHelper.scale(20))
            make.top.equalTo(titleLabel.snp.bottom).offset(SizeHelper.scale(10))
            make.bottom.equalToSuperview().offset(SizeHelper.scale(-25))
            make.trailing.equalTo(SizeHelper.scale(-10))
        }
    }
    
    func update(shortDescription: String) {
        let attString = NSMutableAttributedString(string: shortDescription)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.25
        attString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attString.length))
        self.shortDescriptionLabel.attributedText = attString
    }
    
}
