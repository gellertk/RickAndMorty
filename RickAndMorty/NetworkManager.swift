//
//  HeroManager.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    let api = "https://rickandmortyapi.com/api/character/"

    func getHeroesData(for page: Int, completion: @escaping (Result<PagedHero, Error>) -> ()) {
        guard let url = URL(string: api + "?page=\(page)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            do {
                let heroes = try JSONDecoder().decode(PagedHero.self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getHeroData(for id: Int, completion: @escaping (Result<Hero, Error>) -> ()) {
        guard let url = URL(string: api + "\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            do {
                let hero = try JSONDecoder().decode(Hero.self, from: data)
                completion(.success(hero))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getImage(_ hero: Hero, completion: @escaping (Result<Data, Error>) -> ()) {
        
        if let imgURL = hero.image {
            guard let url = URL(string: imgURL) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else {
                    return
                }
                
                completion(.success(data))
            }
            task.resume()
        }
    }
    
}
