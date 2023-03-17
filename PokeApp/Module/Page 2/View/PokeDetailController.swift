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

    @IBOutlet weak var detailTable: UITableView!
    
    var listPoke: ResultModel?
    var detailUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension PokeDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = sectionDetail(rawValue: indexPath.section)
        switch sections {
        case .header:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: PokeHeaderCell.identifier, for: indexPath) as? PokeHeaderCell else {
                return UITableViewCell()
            }
            
            return cell
        case .pokeImg:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: PokeImageTableCell.identifier, for: indexPath) as? PokeImageTableCell else {
                return UITableViewCell()
            }
            
            return cell
        case .attack:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: QuickAttackLabelTableCell.identifier, for: indexPath) as? QuickAttackLabelTableCell else {
                return UITableViewCell()
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
