//
//  CharacterDetailsViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import UIKit
import SDWebImage
import SnapKit

class CharacterDetailsViewController: UIViewController {
    
    var character: CharacterCellViewModel
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(character: CharacterCellViewModel){
        self.character = character
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = character.name
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(imageView)
        imageView.sd_setImage(with: URL(string: character.image))
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
}
