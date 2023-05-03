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
    
    init(view: CharactersViewProtocol? = nil) {
        self.view = view
    }
    
//    private func updateTableView() {
//        let viewModel: [CharacterCellViewModel] = []
//        // prevratit massiv characters v CharacterCellViewModel
//        DispatchQueue.main.async { [weak self] in
//            self?.view?.updateTableView(viewModel: viewModel)
//        }
//    }
}
