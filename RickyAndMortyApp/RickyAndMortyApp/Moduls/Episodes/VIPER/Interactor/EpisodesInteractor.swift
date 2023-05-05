//
//  EpisodesInteractor.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation

class EpisodesInteractor: EpisodesInteractorProtocol {
    var presenter: EpisodesPresenterProtocol?
    var episodes: [Episode] = []
    
    func getEpisodes() {
        NetworkService.shared.getAllEpisodes { result in
            switch result {
            case .success(let episodes):
                self.episodes = episodes.results
                self.presenter?.interactorFetchEpisodes(with: episodes.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCharactersByEpisode(episode: Episode) {
        let characters = episode.characters
        var ids: [String] = []
        for character in characters {
            let components = NSURL(fileURLWithPath: character).pathComponents!.dropFirst()
            ids.append(components[5])
        }
        let joinedIds = ids.joined(separator: ",")
        
        NetworkService.shared.getCharactersByEpisode(characterIds: joinedIds) { result in
            switch result {
            case .success(let characters):
                self.presenter?.interactorFetchCharacters(characters: characters)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
