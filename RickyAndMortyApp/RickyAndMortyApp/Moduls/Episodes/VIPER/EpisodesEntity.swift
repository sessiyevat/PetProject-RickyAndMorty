//
//  EpisodesEntity.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation

struct EpisodesResponse: Codable {
    let results: [Episode]
}

struct Episode: Codable {
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
}
