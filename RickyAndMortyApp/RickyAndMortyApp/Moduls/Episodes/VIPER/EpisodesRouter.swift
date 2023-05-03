//
//  Router.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation
import UIKit

typealias EntryPoint = EpisodesViewProtocol & UIViewController

protocol EpisodesRouterProtocol {
    var entry: EntryPoint? { get }
    
    static func start() -> EpisodesRouterProtocol
}

class EpisodesRouter: EpisodesRouterProtocol {
    var entry: EntryPoint?
    
    static func start() -> EpisodesRouterProtocol {
        let router = EpisodesRouter()
        
        // Assign VIP
        
        let view = EpisodesViewController()
        let presenter = EpisodesPresenter()
        let interactor = EpisodesInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
