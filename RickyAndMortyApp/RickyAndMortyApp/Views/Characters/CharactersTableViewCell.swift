//
//  CharactersTableViewCell.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit
import SDWebImage

class CharactersTableViewCell: UITableViewCell {
    
    static let identifier = "CharactersTableViewCell"
    
    static var cellHeight: CGFloat = 120
    
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
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let episodesLabel: UILabel = {
       let label = UILabel()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))
        
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        
        contentView.layer.borderColor = UIColor(named: "yellow")?.cgColor
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(episodesLabel)
        
        characterImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(90)
            make.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImageView.snp.trailing).offset(10)
            make.top.equalTo(characterImageView.snp.top)
        }
        
        episodesLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImageView.snp.trailing).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
        }
    }
    
    func configure(with model: CharacterCellViewModel) {
        characterImageView.sd_setImage(with: URL(string: model.image), completed: nil)
        nameLabel.text = model.name
        episodesLabel.text = String(model.episode.count) + " episodes"
        
        if model.status == "Alive" {
            contentView.backgroundColor = UIColor(named: "main")?.withAlphaComponent(0.5)
        } else if model.status == "Dead"{
            contentView.backgroundColor = UIColor(named: "pink")?.withAlphaComponent(0.5)
        } else {
            contentView.backgroundColor = UIColor(named: "yellow")?.withAlphaComponent(0.5)
        }
    }

}
