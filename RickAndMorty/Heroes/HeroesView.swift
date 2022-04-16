//
//  HerosView.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HerosView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HerosView {
    
    func setupView() {
        backgroundColor = .yellow
        setupConstraints()
    }
    
    func setupConstraints() {
        
    }
    
}
