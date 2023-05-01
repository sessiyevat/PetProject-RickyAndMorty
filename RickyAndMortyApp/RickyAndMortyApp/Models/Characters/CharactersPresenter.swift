//
//  CharactersPresenter.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import Foundation

class CharactersPresenter : CharactersPresenterProtocol {
    weak var view: CharactersViewProtocol!
    
    init(view: CharactersViewProtocol){
        self.view = view
    }
}
