//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    private var page: Int = 1
    
    private var heroes: [Hero] = []
    
    private let heroesView = HeroesView()    

    override func loadView() {
        self.view = heroesView
        setupDelegates()
        //heroManager.getHeroes()
    }
    
}

private extension HeroesViewController {
    
    func setupDelegates() {
        //heroManager.delegate = self
        heroesView.delegate = self
        heroesView.heroesTableView.delegate = self
        heroesView.heroesTableView.dataSource = self
    }
    
}

extension HeroesViewController: HeroesViewDelegate {
    
}

//extension HeroesViewController: HeroManagerDelegate {
//
//    func didUpdateHeroes(heroes: [Hero]) {
//        self.heroes = heroes
//        DispatchQueue.main.async { [weak self] in
//            self?.heroesView.heroesTableView.reloadData()
//        }
//    }
//
//}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.reuseId) as? HeroesTableViewCell else {
            
            return UITableViewCell()
        }
        
        NetworkManager.shared.getHeroData(with: page) { [weak self] result in
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(HeroViewController(), animated: true)
    }
    
}

