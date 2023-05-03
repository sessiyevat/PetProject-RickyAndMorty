//
//  Network.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/2/23.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    public func getAllCharacters(completion: @escaping (Result<CharactersResponse, Error>) -> Void ) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(CharactersResponse.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    public func getAllEpisodes(completion: @escaping (Result<String, Error>) -> Void ) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(results)
//                JSONDecoder().decode(CharactersResponse.self, from: data)
//                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}