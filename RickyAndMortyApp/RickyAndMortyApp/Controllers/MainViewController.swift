//
//  MainViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
        charactersTableView.contentInset = UIEdgeInsets(top: -54, left: 0, bottom: 0, right: 0);
//        charactersTableView.backgroundColor = .red
        charactersTableView.separatorStyle = .none
    }
    
    private func setupUI() {
//        view.backgroundColor = .systemBackground
        view.addSubview(charactersTableView)
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
