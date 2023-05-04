//
//  EpisodesCollectionViewCell.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import UIKit
import SnapKit

class EpisodesCollectionViewCell: UICollectionViewCell {
    static let identifier = "EpisodesCollectionViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let episodeLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "pink")?.withAlphaComponent(0.5)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(episodeLabel)
        contentView.addSubview(dateLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(episodeLabel.snp.top)
            make.height.equalTo(50)
        }
        episodeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(dateLabel.snp.top)
            make.height.equalToSuperview().multipliedBy(0.25)

        }
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
    
    func configure(with episode: Episode){
        nameLabel.text = episode.name
        episodeLabel.text = episode.episode
        dateLabel.text = episode.air_date
    }
}
