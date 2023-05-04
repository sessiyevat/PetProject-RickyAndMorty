//
//  CharacterDetailsPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

protocol CharacterDetailsPresenterProtocol {
    
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    weak var view: CharacterDetailsViewProtocol?
    var character: Character?
    
    init(view: CharacterDetailsViewProtocol? = nil) {
        self.view = view
    }
    
    func viewDidLoad() {
        let viewModel = CharacterDetailsViewModel(character: character!)
        updateView(with: viewModel)

    }
    
    private func updateView(with viewModel: CharacterDetailsViewModel?) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.updateView(with: viewModel)
        }
    }
}
