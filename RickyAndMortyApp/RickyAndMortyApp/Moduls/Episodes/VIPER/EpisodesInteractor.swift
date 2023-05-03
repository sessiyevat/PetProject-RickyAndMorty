//
//  EpisodesInteractor.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation

protocol EpisodesInteractorProtocol {
    var presenter: EpisodesPresenterProtocol? { get set }
    
    func getEpisodes()
}

class EpisodesInteractor: EpisodesInteractorProtocol {
    var presenter: EpisodesPresenterProtocol?
    
    func getEpisodes() {
        NetworkService.shared.getAllEpisodes { result in
            switch result {
            case .success(let episodes):
                self.presenter?.interactorFetchEpisodes(with: episodes.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}