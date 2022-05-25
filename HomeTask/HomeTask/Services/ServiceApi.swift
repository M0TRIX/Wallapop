//
//  ServiceApi.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation
import Foundation

class ServiceApi {
    
    func getAllCharacters(completion:@escaping(Landing, URLResponse,Data)->()){
        let url = "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=3fd2f49ed647cb7d5649fb341e35cffc&hash=3ea2cc18772868c32216839754e740e1"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let content = try? decoder.decode(Landing.self, from: data)
            completion(content!,response ?? URLResponse(),data)
        }.resume()
    }
    
    func getOneCharacter(characterId:String,completion:@escaping(Landing, URLResponse,Data)->()){
        let url = "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=3fd2f49ed647cb7d5649fb341e35cffc&hash=3ea2cc18772868c32216839754e740e1"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let content = try? decoder.decode(Landing.self, from: data)
            completion(content!,response ?? URLResponse(),data)
        }.resume()
    }
    
}
