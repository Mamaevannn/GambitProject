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
    @IBOutlet weak var basketButton: UIButton!
   
    var id = 0
    let defaults = UserDefaults.standard
    var amount = 0
    
    func showHide(_ action: Bool){
      basketButton.isHidden = action
  }
    
    func saveCount( _ countFood: Int) {
//        let ifIsFav = requestData(id: id)
//        let isFav = ifIsFav["isFavorite"] ?? 0
//        let item = ["count": countFood, "isFavorite": isFav]
        amountLabel.text = String(countFood)
        defaults.set(countFood, forKey: String(id))
    }
    
//    func requestData(id: String) -> Dictionary<String, Int>{
//        let response = defaults.object(forKey: id) as?  Dictionary<String, Int> ?? ["count": 0, "isFavorite": 0]
        
//    }
    func configure(with menu: Menu) {
        self.nameLabel.text = menu.name
        self.priceLabel.text = "\(menu.price) ₽"
        self.id = menu.id
        
        imageMenu.sd_setImage(with: URL(string: menu.image),
                              placeholderImage: UIImage(systemName: "photo"),
                              options:.continueInBackground,
                              completed: nil)
        
        if defaults.integer(forKey: String(id)) > 0 {
            self.amountLabel.text = String(defaults.integer(forKey: String(id)))
            amount = defaults.integer(forKey: String(id))
            showHide(true)
        }

    }
    
    func plusMinus(_ plusMinus: Bool) {
        if plusMinus {
            amount += 1
        } else {
            amount -= 1
        }
    }
    
    @IBAction func addToBasket(_ sender: UIButton) {
        plusMinus(true)
        saveCount(amount)
        showHide(true)
    }
    
    @IBAction func addOne(_ sender: UIButton) {
        plusMinus(true)
        saveCount(amount)
    }
    
    @IBAction func minusOne(_ sender: UIButton) {
    plusMinus(false)
    saveCount(amount)
        if amount == 0 {
            showHide(false)
        }
    }

}
