//
//  HeroData.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import Foundation

struct PagedHero: Codable {
    let results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let species: String?
    let status: String?
    let gender: String?
    let episode: [String?]
    let image: String?
    var imageData: Data?
    let location: Location
}

struct Location: Codable {
    let name: String
}
