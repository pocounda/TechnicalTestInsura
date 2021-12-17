//
//  JSONHelper.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import Foundation
import UIKit

class JSONHelper{
    func fetchDataUser(completion: @escaping ([User]) -> Void){
        let jsonURLString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: jsonURLString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            do{
                let results = try JSONDecoder().decode([User].self, from: data)
                completion(results)
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }
    
    func fetchDataPost(completion: @escaping ([Post]) -> Void){
        let jsonURLString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: jsonURLString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            do{
                let results = try JSONDecoder().decode([Post].self, from: data)
                
                completion(results)
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }
}

