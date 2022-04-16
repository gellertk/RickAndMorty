//
//  HeroViewController.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroViewController: UIViewController {
    
    var heroId = 0

    override func loadView() {
        view = HeroView()
    }

}
