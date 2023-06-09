//
//  PokeDetailController.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import UIKit

enum sectionDetail: Int {
    case header = 0
    case pokeImg = 1
    case attack = 2
    case agility = 3
    
}

class PokeDetailController: UIViewController {
    
    static let identifier = "PokeDetailController"
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var listPoke: ResultModel?
    var listDetail: StatClass?
    
    
    var pokeDetailViewModel: PokeDetailViewModel?
    var detailPoke: PokemonDetailsModel?
    
    
    var detailUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupDetailViewModel()
        //        setupMovesViewModel()
    }
    
    func registerCell() {
        detailTableView.register(UINib(nibName: PokeHeaderCell.identifier, bundle: nil), forCellReuseIdentifier: PokeHeaderCell.identifier)
        detailTableView.register(UINib(nibName: PokeImageTableCell.identifier, bundle: nil), forCellReuseIdentifier: PokeImageTableCell.identifier)
        detailTableView.register(UINib(nibName: QuickAttackLabelTableCell.identifier, bundle: nil), forCellReuseIdentifier: QuickAttackLabelTableCell.identifier)
        
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    func setupDetailViewModel() {
        self.pokeDetailViewModel = PokeDetailViewModel(urlString: listPoke?.url ?? "", apiService: ApiService())
        
        self.pokeDetailViewModel?.bindPokeData = { detailPokemon in
            if let detailPokemon = detailPokemon {
                DispatchQueue.main.async {
                    self.detailPoke = detailPokemon
                }
                
                DispatchQueue.main.async {
                    self.detailTableView.reloadData()
                }
            }
        }
        
    }
    
    //    func setupMovesViewModel() {
    //        self.pokeDetailViewModel = PokeDetailViewModel(urlString: listDetail?.url ?? "", apiService: ApiService())
    //
    //
    //
    //              self.pokeDetailViewModel?.bindPokeData = { detailPokemon in
    //                  if let detailPokemon = detailPokemon {
    //                      DispatchQueue.main.async {
    //                          self.detailPoke = detailPokemon
    //                      }
    //
    //                      DispatchQueue.main.async {
    //                          self.detailTableView.reloadData()
    //                      }
    //                  }
    //              }
    //    }
    
}

extension PokeDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = sectionDetail(rawValue: indexPath.section)
        switch sections {
        case .header:
            return 50
        case .pokeImg:
            return 200
        case .attack:
            return 100
        case .agility:
            return 100
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = sectionDetail(rawValue: indexPath.section)
        switch sections {
        case .header:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: PokeHeaderCell.identifier, for: indexPath) as? PokeHeaderCell else {
                return UITableViewCell()
            }
            
            cell.pokeName.text = detailPoke?.name
            // call model from basestat
            cell.pokeHP.text = "\(detailPoke?.stats[0].baseStat ?? 0) HP"
            
            return cell
        case .pokeImg:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: PokeImageTableCell.identifier, for: indexPath) as? PokeImageTableCell else {
                return UITableViewCell()
            }
            cell.imgView.sd_setImage(with: URL(string: detailPoke?.sprites.other.home.frontDefault ?? ""), placeholderImage: UIImage(named: "baso"), completed: nil)
            
            
            return cell
        case .attack:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: QuickAttackLabelTableCell.identifier, for: indexPath) as? QuickAttackLabelTableCell else {
                return UITableViewCell()
            }
            
            cell.titleLabel.text = detailPoke?.moves[0].move.name
            // show base attack value
            cell.valueLabel.text = "\(detailPoke?.stats[1].baseStat ?? 0)+"
            // show effectentries
            cell.descLabel.text = detailPoke?.moves[0].move.detail?.effectEntries[0].effect
            
            
            
            // display moves effect
            // cell.descAttack.text = detailPoke?.details.effectEntries[0].effect
            return cell
            
        case .agility:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: QuickAttackLabelTableCell.identifier, for: indexPath) as? QuickAttackLabelTableCell else {
                return UITableViewCell()
            }
            
            
            cell.titleLabel.text = detailPoke?.moves[1].move.name
            cell.valueLabel.text = "\(detailPoke?.stats[2].baseStat ?? 0)+"
            // display moves effect
            // cell.descAttack.text = detailPoke?.details.effectEntries[0].effect
            return cell
            
        default:
            return UITableViewCell()
        }
        //        return UITableViewCell()
    }
    
}
