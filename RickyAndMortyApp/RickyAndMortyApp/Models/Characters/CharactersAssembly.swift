//
//  CharactersAssembly.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation
import UIKit

struct CharactersAssembly {
    static func createModel() -> CharactersViewController {
//        let storyboard = UIStoryboard(name: "CharactersViewController", bundle: .main)
//
//        guard let viewController = storyboard.instantiateInitialViewController() as? CharactersViewController else {
//            fatalError()
//        }
        
        let viewController = CharactersViewController()
        
        let presenter = CharactersPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
