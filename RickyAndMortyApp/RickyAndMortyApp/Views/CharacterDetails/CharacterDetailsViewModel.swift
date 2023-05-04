//
//  CharacterDetailsViewModel.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation

struct CharacterDetailsViewModel{
    let episode: [String]
    let image: String
    let name: String
    let status: String
    let species: String
    let gender: String
    
    init(character: Character){
        self.episode = character.episode
        self.image = character.image
        self.name = character.name
        self.status = character.status
        self.species = character.species
        self.gender = character.gender
    }
}
