//
//  EpisodesPresenterProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

protocol EpisodesPresenterProtocol {
    var router: EpisodesRouterProtocol? { get set }
    var interactor: EpisodesInteractorProtocol? { get set }
    var view: EpisodesViewProtocol? { get set }
    
    func viewDidLoad()
    func interactorFetchEpisodes(with episodes: [Episode])
    func cellDidTaped(at indexPath: IndexPath)
    func interactorFetchCharacters(characters: [Character])
}
