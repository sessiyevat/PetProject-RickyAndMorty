//
//  EpisodesInteractorProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

protocol EpisodesInteractorProtocol {
    var presenter: EpisodesPresenterProtocol? { get set }
    
    func getEpisodes()
    func getCharactersByEpisode(episode: Episode)
}
