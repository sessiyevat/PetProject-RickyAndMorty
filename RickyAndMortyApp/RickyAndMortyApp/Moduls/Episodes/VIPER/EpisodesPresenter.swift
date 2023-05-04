//
//  EpisodesPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation

protocol EpisodesPresenterProtocol {
    var router: EpisodesRouterProtocol? { get set }
    var interactor: EpisodesInteractorProtocol? { get set }
    var view: EpisodesViewProtocol? { get set }
    
    func interactorFetchEpisodes(with episodes: [Episode])
    func cellDidTaped(at characters: [String])
    func updateViewModel(character: Character)
}

class EpisodesPresenter: EpisodesPresenterProtocol {
    var router: EpisodesRouterProtocol?
    
    var interactor: EpisodesInteractorProtocol? {
        didSet {
            interactor?.getEpisodes()
        }
    }
    
    var view: EpisodesViewProtocol?
    var viewModel: [CharacterCellViewModel] = []
    
    func interactorFetchEpisodes(with episodes: [Episode]) {
        view?.update(with: episodes)
    }
    
    func cellDidTaped(at characters: [String]){
        
        for character in characters {
            interactor?.getCharacter(withURL: character)
        }
        
        view?.showCharacters(characters: viewModel)
    }
    
    func updateViewModel(character: Character){
        let model = CharacterCellViewModel(result: character)
        viewModel.append(model)
    }
}
