//
//  HeroView.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroView: UIView {
    
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()
    private let genderLabel = UILabel()
    private let statusLabel = UILabel()
    private let locationLabel = UILabel()
    private let episodeCountLabel = UILabel()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var heroStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       speciesLabel,
                                                       genderLabel,
                                                       statusLabel,
                                                       locationLabel,
                                                       episodeCountLabel],
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
    
    func setupContent(hero: Hero) {
        nameLabel.text = hero.name
        speciesLabel.text = hero.species
        genderLabel.text = hero.gender
        statusLabel.text = hero.status
        locationLabel.text = hero.location.name
        episodeCountLabel.text = "episode count: \(hero.episode.count)"
        avatarImageView.loadImage(urlString: hero.image ?? "")
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
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                 constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 160),
            avatarImageView.widthAnchor.constraint(equalToConstant: 160),
            
            heroStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,
                                              constant: 20),
            heroStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
