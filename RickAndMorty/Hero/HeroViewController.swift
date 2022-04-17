//
//  HeroViewController.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroViewController: UIViewController {
    
    private let heroView = HeroView()
    
    var heroId = 0
    
    override func loadView() {
        view = heroView
    }
    
    init(heroId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.heroId = heroId
        NetworkManager.shared.getHeroData(for: heroId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let hero):
                    self?.heroView.setupContent(hero: hero)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
