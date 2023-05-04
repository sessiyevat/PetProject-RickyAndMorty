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
        // navcontroller
        charactersTableView.frame = view.bounds
//        charactersTableView.contentInset = UIEdgeInsets(top: -54, left: 0, bottom: 0, right: 0);
        charactersTableView.separatorStyle = .none
    }
    
    func updateTableView(viewModel: [CharacterCellViewModel]?){
        guard let characters = viewModel else {
            print("error")
            return
        }
        charactersTableView.reloadData()
    }
    
    func showCharacter(character: Characters) {
        let vc = CharacterDetailsViewController(character: character)
        vc.navigationItem.largeTitleDisplayMode = .never
        DispatchQueue.main.async {
            navigationController?.pushViewController(vc, animated: true)
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharactersTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let character = characters[indexPath.row]
        presenter.cellDidTaped(at: indexPath)
//        let vc = CharacterDetailsViewController(character: character)
//        vc.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(vc, animated: true)
    }
}
