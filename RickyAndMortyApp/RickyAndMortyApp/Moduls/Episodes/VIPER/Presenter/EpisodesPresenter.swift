//
//  EpisodesPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation

class EpisodesPresenter: EpisodesPresenterProtocol {
    
    var router: EpisodesRouterProtocol?
    
    var interactor: EpisodesInteractorProtocol? 
    
    var view: EpisodesViewProtocol?
    var episodes: [Episode] = []
    
    func viewDidLoad() {
        interactor?.getEpisodes()
    }
    
    func interactorFetchEpisodes(with episodes: [Episode]) {
        view?.update(with: episodes)
        self.episodes = episodes
    }
    
    func cellDidTaped(at indexPath: IndexPath){
        let episode = episodes[indexPath.row]
        interactor?.getCharactersByEpisode(episode: episode)
    }
    
    func interactorFetchCharacters(characters: [Character]){
        view?.showCharacters(characters: characters) //router
    }
}
