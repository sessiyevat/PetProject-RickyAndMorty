//
//  EpisodesViewProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

protocol EpisodesViewProtocol {
    var presenter: EpisodesPresenterProtocol? { get set }
    
    func update(with episodes: [Episode])
    func showCharacters(characters: [Character])
}
