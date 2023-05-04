//
//  CharactersAssembly.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/2/23.
//

import Foundation

class CharactersAssembly {
    static func createModel() -> CharactersViewController {
        let viewController = CharactersViewController()
        
        let presenter = CharactersPresenter(view: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
    
//    static func createModel(with viewModel: [CharacterCellViewModel]) -> CharactersViewController {
//        let viewController = CharactersViewController()
//        viewController.characters = viewModel
//        let presenter = CharactersPresenter(view: viewController)
//
//        viewController.presenter = presenter
//        return viewController
//    }
}
