//
//  Webservice.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let responseData = try? JSONDecoder().decode(ResponseData.self, from: data)
                if responseData != nil {
                    completion(responseData?.articles)
                }

                print(responseData?.articles)

            }
        }.resume()
    }
}
