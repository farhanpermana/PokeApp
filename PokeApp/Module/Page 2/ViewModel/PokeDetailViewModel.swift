//
//  PokeDetailViewModel.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import Foundation

protocol moveToPokemonDetail {
    func moveToDetailPokemon(model: ResultModel)
}

protocol ApiServiceDetailProtocol {
    var urlString: String { get set }
    var bindPokeData: ((PokemonDetailsModel?) -> ())? { get set }
    
    func fetchPoke()
}

class PokeDetailViewModel: ApiServiceDetailProtocol {
    private var apiService: ApiService?
    var urlString: String
    var data: PokemonDetailsModel?
    
    var bindPokeData: ((PokemonDetailsModel?) -> ())?
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService as?
        ApiService
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        fetchPoke()
    }
    
    func fetchPoke() {
        self.apiService?.callApi(model: PokemonDetailsModel.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindPokeData?(success)
            case .failure(_):
                self.bindPokeData?(nil)
            }
            
        })
    }
    
    
}
