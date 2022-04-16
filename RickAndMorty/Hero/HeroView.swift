//
//  HeroView.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroView: UIView {
    
    private let nameLabel = UILabel()
    private let species = UILabel()
    private let gender = UILabel()
    private let status = UILabel()
    private let location = UILabel()
    private let episodeCount = UILabel()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(systemName: "person.2")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var heroStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       species,
                                                       gender,
                                                       status,
                                                       location,
                                                       episodeCount],
                                    axis: .vertical,
                                    spacing: 10,
                                    distribution: .fillEqually)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HeroView {
    
    func setupView() {
        backgroundColor = .white
        addSubviews([avatarImageView,
                     heroStackView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 160),
            avatarImageView.widthAnchor.constraint(equalToConstant: 160),
            
            heroStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            heroStackView.heightAnchor.constraint(equalToConstant: 100),
            heroStackView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
