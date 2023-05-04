//
//  CharacterCellViewModel.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation

struct CharacterCellViewModel {
    let episode: [String]
    let image: String
    let name: String
    let status: String
    let species: String
    let gender: String
    
    init(result: Characters){
        self.episode = result.episode
        self.image = result.image
        self.name = result.name
        self.status = result.status
        self.species = result.species
        self.gender = result.gender
    }
}
