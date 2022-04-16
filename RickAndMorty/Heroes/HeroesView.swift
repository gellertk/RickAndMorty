//
//  HerosView.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

protocol HeroesViewDelegate: AnyObject {
    
}

class HeroesView: UIView {
    
    weak var delegate: HeroesViewDelegate?
    
    let heroesTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(HeroesTableViewCell.self,
                           forCellReuseIdentifier: HeroesTableViewCell.reuseId)
        
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HeroesView {
    
    func setupView() {
        addSubviews([heroesTableView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heroesTableView.topAnchor.constraint(equalTo: topAnchor),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
