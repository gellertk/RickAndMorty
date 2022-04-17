//
//  HeroesTableViewCell.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import UIKit

class HeroesTableViewCell: UITableViewCell {
    
    static let reuseId = "HeroesTableViewCell"
    
    var heroId = 0
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       speciesLabel,
                                                       genderLabel],
                                    axis: .vertical,
                                    spacing: 10,
                                    distribution: .fillEqually)
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        speciesLabel.text = ""
        genderLabel.text = ""
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(with hero: Hero) {
        nameLabel.text = hero.name
        speciesLabel.text = hero.species
        genderLabel.text = hero.gender
        heroId = hero.id
        avatarImageView.image = UIImage(data: hero.imageData ?? Data())
    }
    
}

private extension HeroesTableViewCell {
    
    func setupView() {
        accessoryType = .disclosureIndicator
        addSubviews([labelsStackView,
                     avatarImageView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 10),
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor,
                                                      constant: -10),
            
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -40),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
}

