//
//  QuickAttackLabelTableCell.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import UIKit

class QuickAttackLabelTableCell: UITableViewCell {
    
    static let identifier = "QuickAttackLabelTableCell"
    
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var attackValue: UILabel!
    
    @IBOutlet weak var descAttack: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
