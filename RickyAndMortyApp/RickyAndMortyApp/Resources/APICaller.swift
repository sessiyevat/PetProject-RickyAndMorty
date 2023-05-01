//
//  APICaller.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    public func getAllCharacters(completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return } 
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(CharactersResponse.self, from: data)
//                JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(results.results)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
