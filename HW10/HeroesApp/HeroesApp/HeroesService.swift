//
//  HeroesService.swift
//  HeroesApp
//
//  Created by Uldana Shyndali on 26.11.2025.
//

import Foundation
import Alamofire

struct HeroesService {
    func fetchHero(id: Int) async throws -> HeroModel{
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        do{
            let hero = try await AF.request(urlString).serializingDecodable(HeroModel.self).value
            return hero
        }catch{
            print("Server error: \(error)")
            throw error
        }
    }
}
