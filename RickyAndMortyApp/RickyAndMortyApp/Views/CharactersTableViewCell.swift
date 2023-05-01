//
//  CharactersTableViewCell.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    static let identifier = "CharactersTableViewCell"
    
    // MARK: - UI Components
    
    private var characterImageView: UIImageView = {
         let image = UIImageView()
         image.image = UIImage(named: "template")
         image.contentMode = .scaleAspectFill
         image.layer.masksToBounds = true
         return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ricky and Morty"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let episodesLabel: UILabel = {
       let label = UILabel()
        label.text = "3 episodes"
//        label.textColor = UIColor(named: "main")
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(episodesLabel)
        
        characterImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
//            make.trailing.equalTo(nameLabel.snp.leading)
//            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalTo(90)
            make.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImageView.snp.trailing).offset(10)
            make.top.equalTo(characterImageView.snp.top)
//            make.bottom.equalTo(priceLabel.snp.top)
//            make.trailing.equalToSuperview().inset(15)
        }
        
        episodesLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImageView.snp.trailing).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
        }
    }
    
    func configure(name: String, price: String, imageName: String) {
        characterImageView.image = UIImage(named: imageName)
        nameLabel.text = name
        episodesLabel.text = price
    }

}
