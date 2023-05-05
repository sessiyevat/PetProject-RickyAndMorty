//
//  CharacterDetailsPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

protocol CharacterDetailsPresenterProtocol {
    func viewDidLoad()
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    private weak var view: CharacterDetailsViewProtocol?
    private var character: Character?
    
    init(view: CharacterDetailsViewProtocol, character: Character) {
        self.view = view
        self.character = character
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
