//
//  Network.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/2/23.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    func sendRequest<K: Codable>(url: URL, completion: @escaping (Result<K, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(K.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    public func getAllCharacters(completion: @escaping (Result<CharactersResponse, Error>) -> Void ) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        sendRequest(url: url, completion: completion)
    }
    
    public func getAllEpisodes(completion: @escaping (Result<EpisodesResponse, Error>) -> Void ) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        sendRequest(url: url, completion: completion)
    }
        
    public func getNextPageCharacters(withURL url: String, completion: @escaping (Result<CharactersResponse, Error>) -> Void ) {
        guard let url = URL(string: url) else { return }
        sendRequest(url: url, completion: completion)
    }
    
    public func getCharactersByEpisode(characterIds: String, completion: @escaping (Result<[Character], Error>) -> Void ) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(characterIds)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Character].self, from: data)
                print(results)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
