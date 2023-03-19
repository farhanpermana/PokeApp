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
    case attack = 3
}

class PokeDetailController: UIViewController {
    
    static let identifier = "PokeDetailController"

    @IBOutlet weak var detailTableView: UITableView!
    
    var listPoke: ResultModel?
    var detailUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()

    }
    
    func registerCell() {
        detailTableView.register(UINib(nibName: PokeHeaderCell.identifier, bundle: nil), forCellReuseIdentifier: PokeHeaderCell.identifier)
        detailTableView.register(UINib(nibName: PokeImageTableCell.identifier, bundle: nil), forCellReuseIdentifier: PokeImageTableCell.identifier)
        detailTableView.register(UINib(nibName: QuickAttackLabelTableCell.identifier, bundle: nil), forCellReuseIdentifier: QuickAttackLabelTableCell.identifier)
        
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }


}

extension PokeDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            
            return cell
        case .pokeImg:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: PokeImageTableCell.identifier, for: indexPath) as? PokeImageTableCell else {
                return UITableViewCell()
            }
            
            return cell
        case .attack:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: QuickAttackLabelTableCell.identifier, for: indexPath) as? QuickAttackLabelTableCell else {
                return UITableViewCell()
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
