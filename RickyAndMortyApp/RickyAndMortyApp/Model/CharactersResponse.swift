//
//  CharactersResponse.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/2/23.
//

import Foundation

struct CharactersResponse: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let episode: [String]
    let gender: String
    let image: String
    let name: String
    let species: String
    let status: String
}
/*
 
 results =     (
             {
         created = "2017-11-04T18:48:46.250Z";
         episode =             (
             "https://rickandmortyapi.com/api/episode/1",
             "https://rickandmortyapi.com/api/episode/51"
         );
         gender = Male;
         id = 1;
         image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg";
         location =             {
             name = "Citadel of Ricks";
             url = "https://rickandmortyapi.com/api/location/3";
         };
         name = "Rick Sanchez";
         origin =             {
             name = "Earth (C-137)";
             url = "https://rickandmortyapi.com/api/location/1";
         };
         species = Human;
         status = Alive;
         type = "";
         url = "https://rickandmortyapi.com/api/character/1";
     }
 */
