//
//  APIService.swift
//  koganCodingChallenge
//
//  Created by Anki on 12/03/21.
//

import Foundation

class APIService :  NSObject {
    var session: URLSession!
    private let baseURL =  Strings.baseURL
    
    func apiToGetProducts(path: String, completion : @escaping (Product) -> ()){
        let appendedURL = URL(string: baseURL + path )!
        URLSession.shared.dataTask(with: appendedURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                if let productData = try? jsonDecoder.decode(Product.self, from: data){
                    completion(productData)
                }
            }
        }.resume()
    }
}
