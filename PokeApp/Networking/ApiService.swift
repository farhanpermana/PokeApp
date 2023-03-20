//
//  ApiService.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import Foundation

//protocol ApiPokeProtocol {
//    var url: String { get }
//    func callApi(completion: @escaping ([PokeModel]?) -> Void)
//}

protocol ApiServiceProtocol {
    // url API
    mutating func get(url: URL)
    // function for networking handling
    func callApi<T:Codable>(model:T.Type, completion: @escaping (Result<T,Error>) -> Void)
}

struct ApiService: ApiServiceProtocol {
    private var url = URL(string: "")
    mutating func get(url: URL) {
        self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping(Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = self.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(modelData))
                    
                    print("success calling api")
                }
                catch let error {
                    completion(.failure(error))
                    
                    print("error calling api", error)
                }
            }
        }.resume()
    }
}

//struct ApiServicePoke: ApiPokeProtocol {
//    var url: String
//    init(url: String) {
//        self.url = url
//    }
//    func callApi(completion: @escaping ([PokeModel]?) -> Void ) {
//        guard let url = URL(string: self.url) else { return }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let successData = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let modelData = try decoder.decode([PokeModel].self, from: successData)
//                    completion(modelData)
//                } catch {
//                    print("data error")
//                    completion(nil)
//                }
//            }
//            else if let errorMessage = error {
//                print("error", errorMessage)
//            }
//        }
//    }
//}

