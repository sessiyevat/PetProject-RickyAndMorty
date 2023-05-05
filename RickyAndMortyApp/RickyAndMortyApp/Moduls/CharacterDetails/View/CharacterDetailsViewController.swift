//
//  CharacterDetailsViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import UIKit
import SDWebImage
import SnapKit

class CharacterDetailsViewController: UIViewController, CharacterDetailsViewProtocol{
    
    var character: CharacterDetailsViewModel?
    var presenter: CharacterDetailsPresenterProtocol!
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.textColor = UIColor(named: "main")
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()

    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species"
        label.textColor = UIColor(named: "main")
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let characterSpeciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = UIColor(named: "main")
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        presenter.viewDidLoad()
    }
    
    func updateView(with viewModel: CharacterDetailsViewModel?) {
        guard let character = viewModel else { return }
        self.character = character
        
        imageView.sd_setImage(with: URL(string: character.image ?? ""))
        characterStatusLabel.text = character.status
        characterSpeciesLabel.text = character.species
        characterGenderLabel.text = character.gender
    }
    
    func setupUI() {
        title = character?.name
        view.addSubview(imageView)
        view.addSubview(statusLabel)
        view.addSubview(characterStatusLabel)
        view.addSubview(speciesLabel)
        view.addSubview(characterSpeciesLabel)
        view.addSubview(genderLabel)
        view.addSubview(characterGenderLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        characterStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalTo(characterStatusLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        characterSpeciesLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(characterSpeciesLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        characterGenderLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
