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
}

class EpisodesPresenter: EpisodesPresenterProtocol {
    var router: EpisodesRouterProtocol?
    
    var interactor: EpisodesInteractorProtocol? {
        didSet {
            interactor?.getEpisodes()
        }
    }
    
    var view: EpisodesViewProtocol?
    
    func interactorFetchEpisodes(with episodes: [Episode]) {
        view?.update(with: episodes)
    }
}
