//
//  BreweryWebAdaptor.swift
//  Breweries
//
//  Created by Kurumlu, Koza (RCH) on 11/06/2024.
//

import Foundation

class BreweryWebAdaptor {
    static let shared = BreweryWebAdaptor()
    
    private init() {}
    private let baseURL = "https://api.openbrewerydb.org/v1/breweries/"
    private let decoder = JSONDecoder()
    
    
    func search(for query: String, completion: @escaping ([BreweryLightweight]) -> Void) {
        // make URL object
        let query = "autocomplete?query=\(query)"
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        //Make URLSession dataTask
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data, let results = try? self.decoder.decode([BreweryLightweight].self, from: data) else {
                print("Error decoding JSON")
                return
            }
            
            completion(results)
        }
        
        task.resume()
        
    }
    
    
    func getBreweryDate(for query: String, completion: @escaping (Brewery) -> Void) {
        // make URL object
        let query = "\(query)"
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        //Make URLSession dataTask
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data, let results = try? self.decoder.decode(Brewery.self, from: data) else {
                print("Error decoding JSON")
                return
            }
            
            completion(results)
        }
        
        task.resume()
        
    }
    
}

