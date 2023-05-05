//
//  MainViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit
import SnapKit

class CharactersViewController: UIViewController, CharactersViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    enum Layout {
        static var tableTopSpace: CGFloat = -54
    }
    
    var presenter: CharactersPresenterProtocol!
    private var characters = [CharacterCellViewModel]()
    
    var reachedEndOfItems = false
    
    lazy private var charactersTableView: UITableView = {
        let table = UITableView()
        table.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    } ()

    override func loadView() {
        super.loadView()
        view.addSubview(charactersTableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
//        charactersTableView.contentInset = UIEdgeInsets(top: Layout.tableTopSpace, left: 0, bottom: 0, right: 0);
        charactersTableView.separatorStyle = .none
    }
    
    func updateTableView(viewModel: [CharacterCellViewModel]?){
        guard let characters = viewModel else {
            print("error")
            return
        }
        self.characters = characters
        self.charactersTableView.reloadData()
    }
    
    func updateTableViewWith(newViewModel: [CharacterCellViewModel]?) {
        guard let characters = newViewModel else {
            print("error")
            return
        }
        self.characters.append(contentsOf: characters)
        self.charactersTableView.reloadData()
    }
    
    func showCharacter(character: Character) {
        let vc = CharacterDetailsAssembly.createModel(with: character)
        vc.navigationItem.largeTitleDisplayMode = .never
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: characters[indexPath.row])
        
        if indexPath.row == characters.count - 1 {
            presenter?.getNextPageCharacters()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharactersTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.cellDidTaped(at: indexPath)
    }
}

