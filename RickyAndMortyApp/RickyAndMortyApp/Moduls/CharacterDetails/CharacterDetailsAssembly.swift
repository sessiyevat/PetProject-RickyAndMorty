//
//  CharacterDetailsAssembly.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation
import UIKit

class CharacterDetailsAssembly {
    static func createModel(with character: Character) -> CharacterDetailsViewController {
        let viewController = CharacterDetailsViewController()
        
        let presenter = CharacterDetailsPresenter(view: viewController)
        presenter.character = character
        viewController.presenter = presenter
        return viewController
    }
}
