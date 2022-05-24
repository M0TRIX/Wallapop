//
//  ServiceApi.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation
import Foundation

class ServiceApi {
    
    var shared: ServiceApi?
    
    init(share:ServiceApi) {
        self.shared = share
    }
    
    func getCharacters(completion:@escaping(Landing, URLResponse,Data)->()){
        let url = ""
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let content = try? decoder.decode(Landing.self, from: data)
            completion(content!,response ?? URLResponse(),data)
        }.resume()
    }
}
