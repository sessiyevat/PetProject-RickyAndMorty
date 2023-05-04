//
//  EpisodeCharactersRouter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation
import UIKit

typealias EpisodeEntryPoint = EpisodeCharactersViewProtocol & UIViewController

protocol EpisodeCharactersRouterProtocol {
    var entry: EpisodeEntryPoint? { get }
    
    static func start() -> EpisodeCharactersRouterProtocol
}

class EpisodeCharactersRouter: EpisodeCharactersRouterProtocol {
    var entry: EpisodeEntryPoint?
    
    static func start() -> EpisodeCharactersRouterProtocol {
        let router = EpisodeCharactersRouter()
        
        // Assign VIP
        
//        let view = EpisodeCharactersViewController()
//        let presenter = EpisodeCharactersPresenter()
//        let interactor = EpisodeCharactersInteractor()
        
//        view.presenter = presenter
//
//        interactor.presenter = presenter
//
//        presenter.router = router
//        presenter.view = view
//        presenter.interactor = interactor
//
//        router.entry = view as? EntryPoint
        
        return router
    }
}
