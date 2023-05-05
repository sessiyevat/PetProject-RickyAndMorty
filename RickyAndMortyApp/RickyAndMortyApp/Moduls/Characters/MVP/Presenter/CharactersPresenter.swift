//
//  CharactersPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation
import UIKit

class CharactersPresenter: CharactersPresenterProtocol {
    
    weak var view: CharactersViewProtocol?
    var characters: [Character] = []
    
    init(view: CharactersViewProtocol, characters: [Character]? = nil) {
        self.view = view
        self.characters = characters ?? []
    }
    
    func viewDidLoad() {
        if !characters.isEmpty {
            let viewModel = characters.compactMap( {
                return CharacterCellViewModel(result: $0)
                }
            )
            updateTableView(viewModel: viewModel)
        } else {
            getCharacters()
        }
    }
    
    private func getCharacters() {
        NetworkService.shared.getAllCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters.results
                let viewModel = characters.results.compactMap( {
                    return CharacterCellViewModel(result: $0)
                    }
                )
                self?.updateTableView(viewModel: viewModel)
            case .failure(let error):
                print(error.localizedDescription)
                self?.updateTableView(viewModel: nil)
            }
        }
    }
    
    private func updateTableView(viewModel: [CharacterCellViewModel]?) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.updateTableView(viewModel: viewModel)
        }
    }
    
    func cellDidTaped(at indexPath: IndexPath){
        let character = characters[indexPath.row]
        
        view?.showCharacter(character: character)
    }
}
