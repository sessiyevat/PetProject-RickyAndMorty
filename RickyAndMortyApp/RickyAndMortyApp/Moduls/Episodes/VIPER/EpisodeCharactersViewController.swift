//
//  EpisodesCharacterViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/3/23.
//

import UIKit

class EpisodeCharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var characters = [CharacterCellViewModel]()
    
    lazy private var charactersTableView: UITableView = {
        let table = UITableView()
        table.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    } ()
    
    init(characters: [CharacterCellViewModel]) {
        super.init(nibName: nil, bundle: nil)
        self.characters = characters
//        DispatchQueue.main.async {
//            self.charactersTableView.reloadData()
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(charactersTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
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
