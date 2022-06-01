//
//  ServiceApi.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

class ServiceApi {
    
    func getAllCharacters(offset:Int,completion:@escaping(Landing<Result>, URLResponse,Data)->()){
        let domain = Domain()
        var url = domain.getFullDomain() + APIs.CHARACTERS.rawValue + "?offset=" + "\(offset)" + "?limit=20"
        url = url + "&ts=1&apikey="  + domain.public_key + "&" + "hash=" + domain.getHash()
        let urlRequest = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
             let content = try? decoder.decode(Landing<Result>.self, from: data)
            completion(content!,response ?? URLResponse(),data)
                 
            
        }.resume()
    }
    
    func getAllComicsByCharacter(offset:Int,url:String,completion:@escaping(Landing<Comics>, URLResponse,Data)->()){
        let domain = Domain()
        let urlStr = url + "?offset=" + "\(offset)" + "?limit=20" + "&ts=1&apikey="  + domain.public_key + "&" + "hash=" + domain.getHash()
        let urlRequest = URLRequest(url: URL(string: urlStr)!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            if let content = try? decoder.decode(Landing<Comics>.self, from: data) {
            completion(content,response ?? URLResponse(),data)
            }
            
        }.resume()
    }
    
    func getAllSeries(url:String,completion:@escaping(Landing<Series>, URLResponse,Data)->()){
        let domain = Domain()
        let urlStr = url + "?ts=1&apikey="  + domain.public_key + "&" + "hash=" + domain.getHash()
        let urlRequest = URLRequest(url: URL(string: urlStr)!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let content = try? decoder.decode(Landing<Series>.self, from: data) {
            completion(content,response ?? URLResponse(),data)
            }
        }.resume()
    }
    
    func getAllStories(url:String,completion:@escaping(Landing<Stories>, URLResponse,Data)->()){
        let domain = Domain()
        let urlStr = url + "?ts=1&apikey="  + domain.public_key + "&" + "hash=" + domain.getHash()
        let urlRequest = URLRequest(url: URL(string: urlStr)!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let content = try? decoder.decode(Landing<Stories>.self, from: data) {
            completion(content,response ?? URLResponse(),data)
            }
            
        }.resume()
    }
    
}
