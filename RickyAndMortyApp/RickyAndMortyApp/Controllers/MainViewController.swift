//
//  MainViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var characters = [Characters]()
    
    private let charactersTableView: UITableView = {
        let table = UITableView()
        table.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        return table
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        
        APICaller.shared.getAllCharacters { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.characters = model.results
                    self.charactersTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
        charactersTableView.contentInset = UIEdgeInsets(top: -54, left: 0, bottom: 0, right: 0);
        charactersTableView.separatorStyle = .none
    }
    
    private func setupUI() {
        view.addSubview(charactersTableView)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
}
