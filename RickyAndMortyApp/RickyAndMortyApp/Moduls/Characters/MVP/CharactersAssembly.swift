//
//  CharactersAssembly.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/2/23.
//

import Foundation

class CharactersAssembly {
    static func createModel() -> CharactersViewController {
//        let router = CharactersRouter
        let viewController = CharactersViewController()
        
        let presenter = CharactersPresenter(view: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
}
