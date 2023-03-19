//
//  PokeHeaderCell.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import UIKit

class PokeHeaderCell: UITableViewCell {
    
    static let identifier = "PokeHeaderCell"

    @IBOutlet weak var pokeName: UILabel!
    
    @IBOutlet weak var pokeHP: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
