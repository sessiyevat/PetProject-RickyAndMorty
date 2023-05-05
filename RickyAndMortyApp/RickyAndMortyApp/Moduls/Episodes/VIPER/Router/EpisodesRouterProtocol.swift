//
//  EpisodesRouterProtocol.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/4/23.
//

import Foundation
import UIKit

typealias EntryPoint = EpisodesViewProtocol & UIViewController

protocol EpisodesRouterProtocol {
    var entry: EntryPoint? { get }
    
    static func start() -> EpisodesRouterProtocol
}
