//
//  EpisodesView.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import Foundation
import UIKit

protocol EpisodesViewProtocol {
    var presenter: EpisodesPresenterProtocol? { get set }
    
    func update(with episodes: [Episode])
    
}

class EpisodesViewController: UIViewController, EpisodesViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var presenter: EpisodesPresenterProtocol?
    var episodes: [Episode] = []
    
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 7, bottom: 2, trailing: 7)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(150)),
                subitem: item,
                count: 2)
              
            group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
            
            return NSCollectionLayoutSection(group: group)
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        title = "Episodes"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func update(with episodes: [Episode]) {
        DispatchQueue.main.async {
            self.episodes = episodes
            self.collectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.identifier, for: indexPath) as? EpisodesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: episodes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let characters = episodes[indexPath.row].characters
//        print(episodes[indexPath.row].name)
//        print(characters)
        var viewModels: [CharacterCellViewModel] = []
        
        for character in characters {
            NetworkService.shared.getCharacter(characterURL: character) { result in
                switch result {
                case .success(let character):
                    let viewModel = CharacterCellViewModel(result: character)
                    viewModels.append(viewModel)
//                    print(episodeCharacters)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        let vc = EpisodeCharactersViewController(characters: viewModels)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
