//
//  CharactersViewProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit

protocol CharactersViewProtocol : UIViewController, CharactersRouterProtocol {
    func updateTableView(viewModel: [CharacterCellViewModel]?)
    func updateTableViewWith(newViewModel: [CharacterCellViewModel]?)
}
