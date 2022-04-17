//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    private var page = 1
    
    private var heroes: [Hero] = [] {
        didSet {
            DispatchQueue.main.async {
                self.heroesView.heroesTableView.reloadData()
            }

        }
    }
    
    private let heroesView = HeroesView()
    
    override func loadView() {
        self.view = heroesView
        setupDelegates()
    }
    
}

private extension HeroesViewController {
    
    func setupDelegates() {
        heroesView.heroesTableView.delegate = self
        heroesView.heroesTableView.dataSource = self
    }
    
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return heroes.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.reuseId) as? HeroesTableViewCell else {
            
            return UITableViewCell()
        }
                
        if indexPath.row == heroes.count {
            
            NetworkManager.shared.getHeroesData(for: page) { [weak self] result in
                switch result {
                case .success(let models):
                    for var hero in models.results {
                        
                        NetworkManager.shared.getImage(hero) { data in
                            switch data {
                            case .success(let responseData):
                                hero.imageData = responseData
                                self?.heroes.append(hero)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                    self?.page += 1
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        cell.isHidden = true
                    }
                }
            }
            
            return cell
        }
        
        cell.setupContent(with: heroes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? HeroesTableViewCell else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(HeroViewController(heroId: selectedCell.heroId), animated: true)
    }
    
}

