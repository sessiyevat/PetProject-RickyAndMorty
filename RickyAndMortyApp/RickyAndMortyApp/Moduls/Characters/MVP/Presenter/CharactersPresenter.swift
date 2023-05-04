//
//  CharactersPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation
import UIKit

class CharactersPresenter: CharactersPresenterProtocol {

//    private var characters = [Characters]()
    
    weak var view: CharactersViewProtocol?
    var characters: [Characters] = []
    
    init(view: CharactersViewProtocol? = nil) {
        self.view = view
    }
    
    func viewDidLoad() {
        NetworkService.shared.getAllCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters.results
                let viewModel = characters.results.compactMap( {  
                    return CharacterCellViewModel(result: $0)
                    }
                )
//                self?.view?.updateTableView(viewModel: viewModel)
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
