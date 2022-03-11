//
//  TableViewCell.swift
//  GambitProject
//
//  Created by Наида Мамаева on 11.03.2022.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
   
    var id = 0
    func configure(with menu: Menu) {

        
        self.nameLabel.text = menu.name
        self.priceLabel.text = "\(menu.price) ₽"
        self.id = menu.id
        
        imageMenu.sd_setImage(with: URL(string: menu.image),
                              placeholderImage: UIImage(systemName: "photo"),
                              options:.continueInBackground,
                              completed: nil)
        
    }
    

}
