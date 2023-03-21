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
    var detailsPoke: PokemonDetailsModel?
    
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
            case .success(let detailDatas):
                self.detailsPoke = detailDatas
                let group = DispatchGroup()
                
                for (index, move) in detailDatas.moves.enumerated() {
                    group.enter()
                    
                    guard let moveUrl = URL(string: move.move.url) else { group.leave()
                        ;continue }
                    self.apiService?.get(url: moveUrl)
                    self.apiService?.callApi(model: MoveDetailsModel.self, completion: { response in
                        switch response {
                        case .success(let detailMoveDatas):
                            self.detailsPoke?.moves[index].move.detail = detailMoveDatas
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        group.leave()
                    })
                    group.notify(queue: DispatchQueue.main) {
                        self.bindPokeData?(self.detailsPoke)
                    }
                    
                    //                self.bindPokeData?(success)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
            
        })
    }
    
    
}
