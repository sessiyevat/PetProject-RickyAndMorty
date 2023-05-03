//
//  CharactersAssembly.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation
import UIKit

struct MainAssembly {
    static func createModel() -> MainViewController {
//        let router = CharactersRouter
        let viewController = MainViewController()
        
        let presenter = CharactersPresenter(view: viewController)
        
        viewController.presenter = presenter
        return viewController
    }
}
