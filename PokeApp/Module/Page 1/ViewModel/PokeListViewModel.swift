//
//  PokeListViewModel.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import Foundation

protocol ApiServicePokeProtocol {
    var urlString: String { get set}
    var bindPokeData: ((PokeModel?) -> ())? {get set}
    func fetchPoke()
}

class PokeListViewModel: ApiServicePokeProtocol {
    
    private var apiService: ApiService?
    var data: PokeModel?
    var urlString: String
    var bindPokeData: ((PokeModel?) -> ())?
    
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService as? ApiService
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        // call the function for fetch the api data
        fetchPoke()
    }
    
    func fetchPoke() {
        self.apiService?.callApi(model: PokeModel.self, completion: { response in
            switch response {
            case .success(let success):
                print("sukses")
                self.bindPokeData?(success)
            case .failure(_):
                print("error")
                self.bindPokeData?(nil)
            }
        })
    }
    
    //    func numberOfRowsInSection() -> Int {
    //        return self.data?.count ?? 0
    //    }
}
