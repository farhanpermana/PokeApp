//
//  PokeImageTableCell.swift
//  PokeApp
//
//  Created by Farhan on 17/03/23.
//

import UIKit

class PokeImageTableCell: UITableViewCell {
    
    static let identifier = "PokeImageTableCell"
    
    @IBOutlet weak var bgView: UIView!
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    func setupCell() {
        bgView.layer.backgroundColor = UIColor.yellow.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
