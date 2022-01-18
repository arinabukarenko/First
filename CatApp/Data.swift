//
//  Data.swift
//  CatApp
//
//  Created by Арина  on 18.01.22.
//

import Foundation
import UIKit


struct Cats: Codable {
    let breeds: [String]
    let id : String
    let url: String
    let width: Int
    let height: Int
}

struct CatObject{
    let name: String
    let breed: [String]
    let id: String
}

struct DataSource {
    static let catsArray = [
        CatObject(name: "Кошка", breed:[], id: "pHvG7FfsP")
    ]
    
    static func fetchCatName(catId: String, completionHandler: @escaping (Result<Cats, Error>) -> Void) {
        
        print("started task fetch cat \(catId)")
        
        let url = URL(string: "https://cdn2.thecatapi.com/v1/categories\(catId)")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("api_key=52dea80a-f924-4387-ba2f-28d69dad4685", forHTTPHeaderField: "acces_token")
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    print("Completed task fetch \(catId)")
                    let cat = try decoder.decode(Cats.self, from: data)
                    completionHandler(.success(cat))
                } catch {
                    completionHandler(.failure(error))
                    print("error parsing \( try? JSONSerialization.jsonObject(with: data, options:[]))")
                }
            }
        }
        dataTask.resume()
    }
    static func fetchPicture(url: URL, completionHandler: @escaping (Result<UIImage?, Error>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            if let data = try? Data(contentsOf: url) {
                print("complited task fetch picture url \(url)")
                completionHandler(.success(UIImage(data: data)))
            }
        }
        dataTask.resume()
    }
    static func fetchCatsIdPic( catId:String, completionHandler: @escaping (Result<UIImage?, Error>) -> Void) {
        print("started task fetch id pic \(catId)")
        
        fetchCatName(catId: catId) { result in
            switch result {
            case .success(let catsId):
                let url = URL(string: catsId.url)!
                fetchPicture(url: url) { result in
                    completionHandler(result)
                    print("completed task fetch cat \(catId)")
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}




