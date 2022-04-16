//
//  HeroManager.swift
//  RickAndMorty
//
//  Created by Кирилл  Геллерт on 16.04.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    let api = "https://rickandmortyapi.com/api/character"
    
    func getHeroData(with page: Int, completion: @escaping (Result<PagedHero, Error>) -> ()) {
        
        guard let url = URL(string: api + "/?page=\(page))") else {
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
            }
            catch {
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
                guard let data = data, error == nil else {
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
        }
    }
    
//    private func parseJSON(data: Data) -> [Hero] {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(HeroData.self, from: data)
//            
//            return decodedData.results.map {
//                Hero(id: $0.id,
//                     name: $0.name,
//                     species: $0.species,
//                     status: $0.status,
//                     gender: $0.gender,
//                     episodeCount: $0.episode.count,
//                     location: $0.location.name,
//                     image: $0.image)
//            }
//        } catch {
//            print(error.localizedDescription)
//            
//            return [Hero]()
//        }
//    }
    
}
