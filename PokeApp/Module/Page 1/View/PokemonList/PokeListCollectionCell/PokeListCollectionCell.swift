//
//  PokeListCollectionCell.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import UIKit

class PokeListCollectionCell: UICollectionViewCell {
    
    static let identifier = "PokeListCollectionCell"
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        bgView.layer.backgroundColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1.0
        bgView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    
    
    //    func setupData(model: PokeModel) {
    //        titleLabel.text = model.name
    //    
    //        let url = URL(string: model.urlPoke)
    //        DispatchQueue.global().async {
    //            let data = try? Data(contentsOf: url!)
    //            
    //            DispatchQueue.main.async {
    //                self.imgView.image = UIImage(data: data!)
    //            }
    //        }
    //    }
    
    
    
}
