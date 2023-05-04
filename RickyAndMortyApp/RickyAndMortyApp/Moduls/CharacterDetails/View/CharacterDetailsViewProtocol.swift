//
//  CharacterDetailsViewProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation
import UIKit

protocol CharacterDetailsViewProtocol : UIViewController {
    func updateView(with viewModel: CharacterDetailsViewModel?)
}
