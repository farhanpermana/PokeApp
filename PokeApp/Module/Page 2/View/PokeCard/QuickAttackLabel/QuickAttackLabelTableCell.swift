//
//  QuickAttackLabelTableCell.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import UIKit

class QuickAttackLabelTableCell: UITableViewCell {
    
    static let identifier = "QuickAttackLabelTableCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
