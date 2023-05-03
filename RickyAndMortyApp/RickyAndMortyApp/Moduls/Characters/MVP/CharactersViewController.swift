//
//  MainViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit
import SnapKit

class CharactersViewController: UIViewController, CharactersViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    lazy var presenter = CharactersPresenter(view: self)
    private var characters = [CharacterCellViewModel]()
    
    lazy private var charactersTableView: UITableView = {
        let table = UITableView()
        table.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(charactersTableView)
        
        NetworkService.shared.getAllCharacters { result in
            switch result {
            case .success(let characters):
                let viewModel = characters.results.compactMap({ return CharacterCellViewModel(
                    episode: $0.episode, image: $0.image, name: $0.name, status: $0.status) })
                self.updateTableView(viewModel: viewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateTableView(viewModel: [CharacterCellViewModel]){
        characters = viewModel
        
        DispatchQueue.main.async { [weak self] in
            self?.charactersTableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
        charactersTableView.contentInset = UIEdgeInsets(top: -54, left: 0, bottom: 0, right: 0);
        charactersTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let character = characters[indexPath.row]
        let vc = CharacterDetailsViewController(character: character)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

